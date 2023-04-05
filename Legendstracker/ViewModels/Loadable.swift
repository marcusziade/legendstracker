import Combine
import Foundation

protocol Loadable: ObservableObject {
    associatedtype ResultType
    associatedtype ServiceType
    
    var state: LoadableViewState<ResultType> { get set }
    var service: ServiceType { get set }
    
    init(service: ServiceType)
    func refresh() async
}

enum LoadableViewState<ResultType> {
    case loading
    case error(message: String)
    case result(ResultType)
    case empty
}

@MainActor extension Loadable {
    
    func loadResult<T>(_ loadData: () async throws -> T) async {
        state = .loading
        
        var retries = 0
        while retries < 5 {
            do {
                state = .result(try await loadData() as! ResultType)
                break
            } catch let error as HTTPError {
                switch error {
                case .rateLimit:
                    // Delay next try with a second. The ratelimit is 2 requests / second.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        retries += 1
                    }
                default:
                    state = .error(message: error.caption)
                    break
                }
            } catch {
                state = .error(message: error.localizedDescription)
                break
            }
        }
    }
}
