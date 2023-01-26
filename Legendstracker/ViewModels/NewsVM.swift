import Foundation

final class NewsVM: ObservableObject {
    
    enum State {
        case loading
        case result(news: [NewsArticle])
        case error(message: String)
    }
    
    @Published var state: State = .loading
    @Published var showSafari = false
    
    init(service: ApexService) {
        self.service = service
        
        Task { await news() }
    }
    
    func refresh() async { await news() }
    
    // MARK: Private
    
    private let service: ApexService
    
    @MainActor private func news() async {
        state = .loading
        
        var retries = 0
        while retries < 5 {
            do {
                state = try await .result(news: service.news())
                break
            } catch let error as HTTPError {
                switch error {
                case .rateLimit:
                    // Delay next try with a second. The ratelimit is 2 requests / second.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        retries += 1
                        debugPrint("ratelimit shit")
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
    
    static var mock: NewsVM {
        let vm = NewsVM(service: ApexService())
        vm.state = .result(news: ApexService().newsMock)
        return vm
    }
}

