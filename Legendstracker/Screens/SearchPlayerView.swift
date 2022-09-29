//
//  SearchPlayerView.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import SwiftUI

struct SearchPlayerView: View {
    
    @ObservedObject var model: SearchPlayerVM
    
    var body: some View {
        switch model.state {
        case .loading:
            ProgressView()
        case .error(message: let errorMessage):
            Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
        case .result(player: let p):
            VStack {
                TextField("Search player by name...", text: $model.searchQuery)
                Text(p.global.name)
            }
        }
    }
}

struct SearchPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlayerView(model: SearchPlayerVM.mock)
            .preferredColorScheme(.dark)
    }
}
