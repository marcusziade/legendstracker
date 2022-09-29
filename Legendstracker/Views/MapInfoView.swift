//
//  MapInfoView.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import SwiftUI

struct MapInfoView: View {
        
    let isCurrent: Bool
    let rotation: MapRotationResponse
    
    var body: some View {
        VStack {
            Image(systemName: isCurrent ? "play.fill" : "text.insert")
                .fontWeight(.black)
                .foregroundColor(isCurrent ? .green : .cyan)
            Text(isCurrent ? "Current map" : "Next map")
                .font(.largeTitle)
                .fontWeight(.black)
            Label(isCurrent ? rotation.current.map : rotation.next.map, systemImage: "map")
                .font(.title)
                .fontWeight(.black)
            Text(isCurrent ? rotation.currentDateText : rotation.nextDateText)
                .font(.title)
                .fontWeight(.black)
            Text(isCurrent ? rotation.currentIntevalText : rotation.nextIntevalText)
                .font(.title)
                .fontWeight(.black)
        }
    }
}

struct MapInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MapInfoView(isCurrent: true, rotation: ApexService().mapRotation_Mock)
            .preferredColorScheme(.dark)
    }
}
