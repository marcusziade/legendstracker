//
//  NewsVM.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

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
        do {
            state = try await .result(news: service.news())
        } catch let error as HTTPError {
            state = .error(message: error.caption)
            debugPrint(error.caption)
        } catch {
            debugPrint(error)
            state = .error(message: error.localizedDescription)
        }
    }
    
    static var mock: NewsVM {
        let vm = NewsVM(service: ApexService())
        vm.state = .result(news: ApexService().newsMock)
        return vm
    }
}
