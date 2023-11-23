//
//  SongModel.swift
//  Spotify2
//
//  Created by Sabrina De Crescenzo on 14/11/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model class SongModel {
    var image: String
    var name: String
    var artist: String
    var album: String
    
    init(name: String, artist: String, album: String, image: String) {
        self.name = name
        self.artist = artist
        self.album = album
        self.image = image
    }
}
