//
//  Episode.swift
//  BBQuotes
//
//  Created by Vinod Rathod on 24/05/25.
//

import Foundation


struct Episode: Decodable {
    let episode: Int
    let title: String
    let image: URL
    let synopsis: String
    let writtenBy: String
    let directedBy: String
    let airDate: String
    
    var seasonEpisode: String {
        "Season \(episode / 100) Episode \(episode % 100)"
    }
}
