//
//  Spotify2App.swift
//  Spotify2
//
//  Created by Sabrina De Crescenzo on 14/11/23.
//

import SwiftUI
import SwiftData

@main
struct SabifyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .preferredColorScheme(.dark)

                    .tabItem {
                        Image(systemName:"house.fill")
                        Text("Home")
                    }
                SearchPageView()
                    .preferredColorScheme(.dark)

                    .tabItem {
                        Image(systemName:"magnifyingglass")
                        Text("Search")
                    }
                LikedSongsView()
                    .preferredColorScheme(.dark)

                    .tabItem {
                        Image(systemName:"books.vertical")
                        Text("Your Library")
                    }
            }
            .tint(.white)
            .preferredColorScheme(.dark)
        }
        .modelContainer(for: [SongModel.self, Album.self])
        
    }
}
