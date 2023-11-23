//
//  Album.swift
//  Sabify
//
//  Created by Sabrina De Crescenzo on 17/11/23.
//

import Foundation
import SwiftData

@Model class Album {
    var image: String
    var artist: String
    var name: String
    
    init(image: String, artist: String, name: String) {
        self.image = image
        self.artist = artist
        self.name = name
    }
}
