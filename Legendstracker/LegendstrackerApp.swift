//
//  LegendstrackerApp.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//

import SwiftUI

@main
struct LegendstrackerApp: App {
    
    @StateObject var searchPlayerViewModel = SearchPlayerVM(service: ApexService())
    @StateObject var newsViewModel = NewsVM(service: ApexService())
    @StateObject var serverStatusViewModel = ServerStatusVM(service: ApexService())
    @StateObject var mapRotationViewModel = MapRotationVM(service: ApexService())
    @StateObject var storeViewModel = StoreVM(service: ApexService())
    
    var body: some Scene {
        WindowGroup {
            TabView {
//                SearchPlayerView(model: searchPlayerViewModel)
//                    .tabItem {
//                        Label("Search", systemImage: "doc.text.magnifyingglass")
//                    }
                NewsVCView(model: newsViewModel)
                    .tabItem {
                        Label("News UIKit", systemImage: "newspaper.fill")
                    }
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
                StoreView(model: storeViewModel)
                    .tabItem {
                        Label("Store", systemImage: "bag")
                    }
            }
        }
    }
}

struct NewsVCView: UIViewControllerRepresentable {

    let model: NewsVM

    func makeUIViewController(context: Context) -> some NavigationController {
        let vm = model
        let vc = NewsVC(model: vm)
        return NavigationController(rootVC: vc)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
