//
//  ContentView.swift
//  BBQuotes
//
//  Created by Vinod Rathod on 12/05/25.
//

import SwiftUI

struct ContentView: View {
    @State var selectedItem: Int? = 0
    
    var body: some View {
        TabView {
            Tab("Breaking Bad", systemImage: "tortoise.fill") {
                QuoteView(show: "Breaking Bad")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            Tab("Better Call Saul", systemImage: "tortoise.fill") {
                QuoteView(show: "Better Call Saul")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("El Camino", systemImage: "car") {
                QuoteView(show: "El Camino")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
