//
//  ContentView.swift
//  BBQuotes
//
//  Created by José João Pimenta Oliveira on 20/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            QuoteView()
                .tabItem { Label("Breaking Bad", systemImage: "tortoise") }

            Text("Better Call Saul View")
                    .tabItem { Label("Better Call Saul", systemImage: "briefcase") }
        }
        .onAppear {
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
