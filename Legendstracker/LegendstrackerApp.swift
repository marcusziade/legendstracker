//
//  LegendstrackerApp.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//

import SwiftUI

@main
struct LegendstrackerApp: App {
    
    @StateObject var newsViewModel = NewsVM(service: ApexService())
    @StateObject var serverStatusViewModel = ServerStatusVM(service: ApexService())
    @StateObject var mapRotationViewModel = MapRotationVM(service: ApexService())
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NewsView(model: newsViewModel)
                    .tabItem {
                        Label("News", systemImage: "newspaper")
                    }
                ServerStatusView(model: serverStatusViewModel)
                    .tabItem {
                        Label("Status", systemImage: "network")
                    }
                MapRotationView(model: mapRotationViewModel)
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
            }
        }
    }
}
