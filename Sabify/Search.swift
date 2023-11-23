//
//  Search.swift
//  Sabify
//
//  Created by Sabrina De Crescenzo on 17/11/23.
//

import Foundation
import SwiftData
import SwiftUI

struct Monnezza: View {
    @Query var albums: [Album]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
//        Button("Button") {
//            modelContext.insert(Album(image: "DarkEye", artist: "Creepy", name: "Eye Watching"))
//        }
        List {
            ForEach (albums) { album in
                Text(album.name)
                
            }
            .onDelete(perform: deleteAlbum(_:))
            
        }
        
    }

    func deleteAlbum(_ indexSet: IndexSet) {
        for index in indexSet {
            let monnezza = albums[index]
            modelContext.delete(monnezza)
        }
    }
}
