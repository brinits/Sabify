//
//  ContentView.swift
//  Spotify2
//
//  Created by Sabrina De Crescenzo on 14/11/23.
//

import SwiftUI
import SwiftData

//TODO: sistemare alignment testo

struct ContentView: View {
    @State var cosetta: String = "All"
    
    @Environment(\.modelContext) private var modelContext
    @Query private var songs: [SongModel]
    @Query private var albums: [Album]
    
    var body: some View {
        NavigationStack {
            ZStack {
                //MARK: Background
                Rectangle()
                    .fill(.nerino)
                    .ignoresSafeArea()
                
                VStack {
                    //MARK: Custom segmented control
                    VStack {
                        HStack{
                            Image("FotoProfilo")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width:35, height:35)
                            
                            Button("All      ") {
                                cosetta="All"
                            }
                            .padding()
                            .background(cosetta=="All" ? .verdino : .grigione)
                            .clipShape(Capsule()
                                .scale(0.8))
                            .font(.footnote)
                            .bold()
                            .tint(cosetta=="All" ? .black : .white)
                            
                            .padding(.trailing, -16)
                            
                            Button("Music      ") {
                                cosetta="Music"
                            }
                            .padding()
                            .background(cosetta=="Music" ? .verdino : .grigione)
                            .clipShape(Capsule()
                                .scale(0.8))
                            .font(.footnote)
                            .bold()
                            .tint(cosetta=="Music" ? .black : .white)
                            .padding(.trailing, -20)
                            
                            
                            Button("Podcast       ") {
                                cosetta="Podcast"
                            }
                            .padding()
                            .background(cosetta=="Podcast" ? .verdino : .grigione)
                            .clipShape(Capsule()
                                .scale(0.8))
                            .font(.footnote)
                            .bold()
                            .tint(cosetta=="Podcast" ? .black : .white)
                            
                        }
                        .padding(.trailing, 70)
                        .padding(.bottom, -7)
                        .padding(.top)
                    }
                    
                    ScrollView(showsIndicators: false) {
                        //MARK: Otto cosi che devono spawnare
                        HStack {
                            VStack (alignment: .leading) {
                                NavigationLink(destination:LikedSongsView()) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundStyle(.grigione)
                                        HStack {
                                            Image("LikedSongs")
                                                .resizable()
                                                .frame(width:65, height: 65)
                                                //.padding(.trailing, 5)
                                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                            
                                            Text("Liked Songs")
                                                .font(.footnote)
                                                .foregroundColor(.white)
                                                .bold()
                                                
                                           
                                        }
                                        .padding(.trailing, 24)
                                    }
                                  
                                }
                                
                                ForEach(albums.prefix(3)) { album in
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundStyle(.grigione)
                                        HStack {
                                            Image(album.image)
                                                .resizable()
                                                .frame(width:65, height:65)
                                                .padding(.trailing, 5)
                                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                            VStack{
                                                Text(album.name)
                                                    .font(.footnote)
                                                    .foregroundColor(.white)
                                                    .bold()
                                            }
                                            .padding(.leading, -5)
                                            
                                        }
                                    } .accessibilityElement()
                                        .accessibilityLabel(album.name)
                                }
                                
                            }.padding (.leading, 15)
                            
                            
                            VStack(alignment: .leading) {
                                ForEach(albums.prefix(7).dropFirst(3)) { album in
                                    ZStack (alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundStyle(.grigione)
                                        HStack {
                                            Image(album.image)
                                                .resizable()
                                                .frame(width:65, height:65)
                                                .padding(.trailing, 5)
                                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                            
                                            VStack {
                                                Text(album.name)
                                                    .font(.footnote)
                                                    .foregroundColor(.white)
                                                    .bold()
                                                
                                            }
                                            .padding(.leading, -5)
                                        }
                                    } .accessibilityElement()
                                        .accessibilityLabel(album.name)
                                }
                                
                                
                            } .padding (.trailing, 15)
                        } .padding (.top)
                            .frame(height:300)
                        
//                        Button("Button") {
//                            modelContext.insert(Album(image: "DarkEye", artist: "Creepy", name: "Eye Watching"))
//                            modelContext.insert(Album(image: "TheSunsetsDawn", artist: "Lampa", name: "The Sunset's Dawn"))
//                            modelContext.insert(Album(image: "Conscious", artist: "Lampa", name: "Conscious"))
//                            modelContext.insert(Album(image: "Mushroom", artist: "YRN", name: "Psylocybin"))
//                            modelContext.insert(Album(image: "BackInTheRace", artist: "Lampa", name: "Back In The Race"))
//                            modelContext.insert(Album(image: "CreepyGuy", artist: "The Walls", name: "Creep"))
//                            modelContext.insert(Album(image: "KurtCobain", artist: "Lampa", name: "Kurt Cobain"))
//                            modelContext.insert(Album(image: "Ocean", artist: "Seafret", name: "Ocean"))
//                        }
                        
                        //MARK: Recent Listening
                        VStack {
                            Text("Based on your recent listening")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                                .padding(.trailing, 60)
                                .padding(.top, 10)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(albums .shuffled()) { album in
                                        VStack {
                                            Image(album.image)
                                                .resizable()
                                                .frame(width:160, height:160)
                                                .accessibilityHidden(true)
                                            
                                            Text(album.name)
                                                .foregroundStyle(.grigetto)
                                                .font(.footnote)
                                                .frame(width:160, alignment:.leading)
                                        } .accessibilityElement()
                                            .accessibilityLabel(album.name)
                                    }
                                } 
                                .padding(.leading, 10)
                                    .padding(.trailing, 10)
                            } 
                        }
                        
                        //MARK: Made for you
                        VStack {
                            Text("Made for plzcallmebree")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                                .padding(.trailing, 130)
                                .padding(.top, 10)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(albums .shuffled()) { album in
                                        VStack {
                                            Image(album.image)
                                                .resizable()
                                                .frame(width:160, height:160)
                                                .accessibilityHidden(true)
                                            
                                            Text(album.name)
                                                .foregroundStyle(.grigetto)
                                                .font(.footnote)
                                                .frame(width:160, alignment:.leading)
                                        } .accessibilityElement()
                                            .accessibilityLabel(album.name)
                                    }
                                    
                                } .padding(.leading, 10)
                                    .padding(.trailing, 10)
                                
                                
                                
                            }
                            
                        }
                        
                        //MARK: Recently played
                        VStack {
                            Text("Recently played")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                                .padding(.trailing, 210)
                                .padding(.top, 10)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(albums .shuffled()) { album in
                                        VStack {
                                            Image(album.image)
                                                .resizable()
                                                .frame(width:100, height:100)
                                                .accessibilityHidden(true)
                                            Text(album.name)
                                                .lineLimit(1)
                                                .foregroundStyle(.grigetto)
                                                .font(.footnote)
                                                .frame(width:100, alignment:.leading)
                                        } .accessibilityElement()
                                            .accessibilityLabel(album.name)
                                    }
                                    
                                } .padding(.leading, 10)
                                    .padding(.trailing, 10)
                                
                                
                                
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Album.self, configurations: config)
    
    return ContentView()
        .modelContainer(container)
}
