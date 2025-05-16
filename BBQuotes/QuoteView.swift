//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Vinod Rathod on 13/05/25.
//

import Foundation
import SwiftUI

struct QuoteView: View {
    let vm = ViewModel()
    let show: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    Text("\(vm.quote.quote)")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black.opacity(0.5))
                        .cornerRadius(25)
                        .padding(.horizontal)
                    
                    ZStack {
                        AsyncImage(url: vm.character.images[1]) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(20)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geo.size.width / 1.8, height: geo.size.height / 1.8)

                        Text(vm.quote.character)
                    }
                    .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.7)
                }
                .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
        .preferredColorScheme(.dark)
}
