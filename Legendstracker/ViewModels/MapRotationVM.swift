//
//  MapRotationVM.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

final class MapRotationVM: ObservableObject {
    
    enum State {
        case loading
        case error(message: String)
        case result(rotation: MapRotationResponse)
    }
    
    @Published var state: State = .loading
    @Published var editorText: String = "Type your text here..."
    
    init(service: ApexService) {
        self.service = service
        
        Task { await mapRotation() }
    }
    
    // MARK: Private
    
    private let service: ApexService
    
    @MainActor private func mapRotation() async {
        do {
            debugPrint(try await service.mapRotation())
            state = .result(rotation:  try await service.mapRotation())
        } catch let error as HTTPError {
            state = .error(message: error.caption)
        } catch {
            debugPrint(error)
            state = .error(message: error.localizedDescription)
        }
    }
    
    static var mock: MapRotationVM {
        let vm = MapRotationVM(service: ApexService())
        vm.state = .result(rotation: ApexService().mapRotation_Mock)
        return vm
    }
}
