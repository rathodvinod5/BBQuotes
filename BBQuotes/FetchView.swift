//
//  FetchView.swift
//  BBQuotes
//
//  Created by Vinod Rathod on 03/06/25.
//

//
//  FetchView.swift
//  BBQuotes
//
//  Created by Vinod Rathod on 13/05/25.
//

import Foundation
import SwiftUI

struct FetchView: View {
    let vm = ViewModel()
    let show: String
    
    @State var showCharacterInfo = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.removeCaseAndSpace())
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    VStack {
                        Spacer(minLength: 60)
                    
                        switch vm.status {
                        case .notStarted:
                            EmptyView()
                            
                        case .fetching:
                            ProgressView()
                            
                        case .successQuote:
                            Text("\"\(vm.quote.quote)\"")
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.black.opacity(0.5))
                                .cornerRadius(25)
                                .padding(.horizontal)
                            
                            ZStack(alignment: .bottom) {
                                AsyncImage(url: vm.character.images[0]) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.8)
                                
                                Text(vm.quote.character)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(.ultraThinMaterial)
                            }
                            .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.8)
                            .clipShape(.rect(cornerRadius: 50))
                            .onTapGesture {
                                showCharacterInfo.toggle()
                            }
                            
                        case .failed(let error):
                            let _ = print("error: " + error.localizedDescription)
                            Text("error: " + error.localizedDescription)
                        case .succesEpisode:
                            EpisodeView(episode: vm.episode)
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Button {
                            Task {
                                await vm.getQuoteData(for: show)
                            }
                        } label: {
                            Text("Get Random Quote")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("\(show.replaceSpaces())Button"))
                                .cornerRadius(7)
                                .shadow(color: Color("\(show.replaceSpaces())Shadow"), radius: 2)
                        }
                        
                        Spacer(minLength: 20)
                        
                        Button {
                            Task {
                                await vm.getEpisode(for: show)
                            }
                        } label: {
                            Text("Get Random Quote")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("\(show.replaceSpaces())Button"))
                                .cornerRadius(7)
                                .shadow(color: Color("\(show.replaceSpaces())Shadow"), radius: 2)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 95)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .sheet(isPresented: $showCharacterInfo) {
            CharacterView(character: vm.character, show: show)
        }
    }
}

#Preview {
    FetchView(show: Constants.bbName)
        .preferredColorScheme(.dark)
}

