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
            Tab(Constants.bbName, systemImage: "tortoise.fill") {
                FetchView(show: Constants.bbName)
            }
            Tab(Constants.bcsName, systemImage: "briefcase") {
                FetchView(show: Constants.bcsName)
            }
            
            Tab(Constants.ecName, systemImage: "car") {
                FetchView(show: Constants.ecName)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
