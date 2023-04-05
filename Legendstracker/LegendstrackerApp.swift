import SwiftUI

@main
struct LegendstrackerApp: App {

    var body: some Scene {
        WindowGroup {
            TabView {
                SearchPlayerView()
                    .tabItem {
                        Label("Search", systemImage: "doc.text.magnifyingglass")
                    }
                NewsVCView()
                    .tabItem {
                        Label("News", systemImage: "newspaper.fill")
                    }
                ServerStatusView()
                    .tabItem {
                        Label("Status", systemImage: "network")
                    }
                MapRotationView()
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
                StoreView()
                    .tabItem {
                        Label("Store", systemImage: "bag")
                    }
            }
        }
    }
}

struct NewsVCView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> some NavigationController {
        let vc = NewsVC()
        return NavigationController(rootVC: vc)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
