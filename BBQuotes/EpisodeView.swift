//
//  EpisodeView.swift
//  BBQuotes
//
//  Created by Vinod Rathod on 03/06/25.
//

import SwiftUI

struct EpisodeView: View {
    let episode: Episode
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(episode.title)
                .font(.largeTitle)
            
            Text(episode.seasonEpisode)
                .font(.title2)
            
            AsyncImage(url: episode.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 20))
            } placeholder: {
                ProgressView()
            }
            
            Text(episode.synopsis)
                .padding(.bottom)
            
            Text("Written by: \(episode.writtenBy)")
            
            Text("Directed by: \(episode.directedBy)")
            
            Text("Aired: \(episode.airDate)")
        }
        .padding()
        .foregroundStyle(Color.white)
        .background(Color.black.opacity(0.6))
        .clipShape(.rect(cornerRadius: 25))
        .padding(.horizontal)
    }
}

#Preview {
    EpisodeView(episode: ViewModel().episode)
}
