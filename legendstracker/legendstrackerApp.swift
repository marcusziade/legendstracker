//
//  legendstrackerApp.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//

import SwiftUI

@main
struct legendstrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}
