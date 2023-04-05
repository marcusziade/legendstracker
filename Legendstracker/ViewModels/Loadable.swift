import Combine
import Foundation

/// A protocol that defines the requirements for an object that manages
/// the loading state and fetches data asynchronously.
protocol Loadable: ObservableObject {
    /// The associated type representing the result of a successful data fetch.
    associatedtype ResultType
    /// The associated type representing the service used to fetch data.
    associatedtype ServiceType
    
    /// The current state of the loadable object.
    var state: LoadableViewState<ResultType> { get set }
    /// The service used to fetch data.
    var service: ServiceType { get set }
    
    /// Initializes a new loadable object with the specified service.
    init(service: ServiceType)
    /// Refreshes the data.
    func refresh() async
}

/// An enumeration representing the possible states of a loadable object.
enum LoadableViewState<ResultType> {
    /// Indicates that the data is being loaded.
    case loading
    /// Indicates that an error occurred while loading the data.
    case error(message: String)
    /// Indicates that the data was successfully loaded.
    case result(ResultType)
    /// Indicates that no data is present.
    case empty
}

/// An extension that provides a default implementation for loading data
/// and updating the state of a loadable object.
@MainActor extension Loadable {
    
    /// Loads data using the given asynchronous function and updates the
    /// state of the loadable object.
    ///
    /// - Parameter loadData: The async function that fetches the data.
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
