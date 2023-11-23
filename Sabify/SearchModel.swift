//
//  SearchModel.swift
//  Sabify
//
//  Created by Sabrina De Crescenzo on 21/11/23.
//

import Foundation
import SwiftUI

struct Collection : Identifiable {
    var id = UUID()
    var title : String
    var imageName : String
}

let collectionData: [Collection] = [
    Collection(title: "Podcast", imageName: "VScurino"),
    Collection(title: "Live Events", imageName: "violino"),
    Collection(title: "Made For You", imageName: "Bluino"),
    Collection(title: "New Releases", imageName: "Magentino"),
    Collection(title: "Summer", imageName: "Acquino"),
    Collection(title: "Pop", imageName: "Verdino"),
    Collection(title: "Rock", imageName: "Rossino"),
    Collection(title: "Hip-Hop", imageName: "VScurino"),
    Collection(title: "Latin", imageName: "Bluino"),
    Collection(title: "Happy Christmas", imageName: "violino"),
    Collection(title: "Indie", imageName: "violino"),
    Collection(title: "Discover", imageName: "Rossino"),
    Collection(title: "Mood", imageName: "VScurino"),
    Collection(title: "Trending", imageName: "Verdino"),
    Collection(title: "In the car", imageName: "Bluino"),
    Collection(title: "Gaming", imageName: "Magentino")
]
