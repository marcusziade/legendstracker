//
//  ServerStatusView.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import SwiftUI

struct ServerStatusView: View {
    
    @ObservedObject var model: ServerStatusVM
    
    var body: some View {
        switch model.state {
            
        case .loading:
            ProgressView()
            
        case .error(message: let errorMessage):
            Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
            
        case .result(status: let status):
            ServerStatusRegionsView(status: status)
        }
    }
}

struct ServerStatusView_Previews: PreviewProvider {
    static var previews: some View {
        ServerStatusView(model: ServerStatusVM.mock)
    }
}
