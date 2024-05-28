import SwiftUI

@main
struct LegendstrackerApp: App {
    
    let service = ApexService()

    var body: some Scene {
        WindowGroup {
            TabView {
                SearchPlayerView(model: SearchPlayerVM(service: service))
                    .tabItem {
                        Label("Search", systemImage: "doc.text.magnifyingglass")
                    }
                NewsVCView(service: service)
                    .tabItem {
                        Label("News", systemImage: "newspaper.fill")
                    }
                ServerStatusView(model: ServerStatusVM(service: service))
                    .tabItem {
                        Label("Status", systemImage: "network")
                    }
                MapRotationView(model: MapRotationVM(service: service))
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
                StoreView(model: StoreVM(service: service))
                    .tabItem {
                        Label("Store", systemImage: "bag")
                    }
            }
        }
    }
}

struct NewsVCView: UIViewControllerRepresentable {
    
    let service: ApexService
    
    init(service: ApexService) {
        self.service = service
    }

    func makeUIViewController(context: Context) -> some NavigationController {
        let model = NewsVM(service: service)
        let vc = NewsVC(model: model)
        return NavigationController(rootVC: vc)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
