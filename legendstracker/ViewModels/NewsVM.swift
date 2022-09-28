//
//  NewsVM.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

final class NewsVM: ObservableObject {
    
    enum State {
        case loading
        case result(news: [News])
        case error(message: String)
    }
    
    @Published var state: State = .loading
    
    init() {
        Task { await news() }
    }
    
    // MARK: Private
    
    private let service = ApexService()
    
    @MainActor private func news() async {
        state = .loading
        do {
            state = try await .result(news: service.news())
        } catch let error as HTTPError {
            state = .error(message: error.caption)
            debugPrint(error.caption)
        } catch {
            state = .error(message: error.localizedDescription)
            debugPrint(error)
        }
    }
}
