//
//  LikedSongs.swift
//  Sabify
//
//  Created by Sabrina De Crescenzo on 20/11/23.
//

import Foundation
import SwiftData
import SwiftUI

struct LikedSongsView: View {
    @Query private var songs: [SongModel]
    @Environment(\.modelContext) var context
    
    
    var body: some View {
        NavigationStack {
            
                ZStack {
                    //MARK: Background
                    Rectangle()
                        .fill(.nerino)
                        .ignoresSafeArea()
                    //                .fill(LinearGradient(colors: [.blue, .nerino], startPoint: .top, endPoint: .bottom))
                    
                    
                    VStack(alignment: .leading) {
                        Text("Liked Songs")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .padding(.leading)
                        
                        Text("1.367 songs")
                            .foregroundColor(.grigino)
                            .padding(.leading)
                            .padding(.top, -15)
                        
                        
                        HStack {
                                Image(systemName: "arrow.down.circle")
                                    .foregroundColor(.grigino)
                                    .font(.system(size: 20))
                                    .padding(.leading)
                             .accessibilityLabel("Download All Songs Button")
                             .accessibilityRemoveTraits(.isImage)
                                
                                
                            
                            
                            Spacer()
                            Image (systemName: "shuffle")
                                .foregroundColor(.grigino)
                                .font(.system(size: 20))
                                .padding(.trailing, 3)
                                .accessibilityLabel("Shuffle Button")
                                .accessibilityRemoveTraits(.isImage)
                            
                            
                            ZStack(alignment: .center) {
                                Circle()
                                    .foregroundColor(.verdino)
                                    .frame(width:50, height:50)
                                    .padding(.trailing)
                                Image (systemName: "play.fill")
                                    .foregroundColor(.nerino)
                                    .font(.system(size: 20))
                                    .padding(.trailing)
                                    .accessibilityLabel("Play Button")
                                    .accessibilityRemoveTraits(.isImage)
                                
                            }
                            
                        }
                        
                        ZStack {
                            Rectangle()
                                .fill(.nerino)
                                .ignoresSafeArea()
                            
                            List {
                                ForEach(songs) { song in
                                    HStack {
                                        Image(song.image)
                                            .resizable()
                                            .frame(width:55, height:55)
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .padding(.trailing, 8)
                                            .accessibilityHidden(true)
                                            
                                        
                                        
                                        VStack(alignment: .leading) {
                                            Text(song.name)
                                                .bold()
                                            Text(song.artist + " • " + song.album)
                                                .font(.footnote)
                                                
                                            
                                        }
                                    } 
                                    .listRowBackground(Rectangle().fill(.nerino))
                                    .accessibilityElement()
                                    .accessibilityLabel(song.name + song.artist + song.album)
                                }
                                .onDelete(perform: deleteSong(_:))
                                .listRowSeparator(.hidden)
                                
                            }
                            .listStyle(.plain)
                        }
                    } .padding(.top, 40)
                    
//                    Button("Button") {
//                        context.insert(SongModel(name: "Back In The Race", artist: "Lampa", album: "Single", image: "BackInTheRace"))
//                        context.insert(SongModel(name: "Eye Watching", artist: "Birdz", album: "Awakening", image: "DarkEye"))
//                        
//                    }
                    
                    
                 //.padding(.top, 20)
            }
        }
    }
    func deleteSong(_ indexSet: IndexSet) {
        for index in indexSet {
            let monnezza = songs[index]
            context.delete(monnezza)
        }
    }
}
    

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Album.self, configurations: config)
    
    return LikedSongsView()
        .modelContainer(container)
}

