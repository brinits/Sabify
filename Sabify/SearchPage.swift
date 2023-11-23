//
//  SearchPage.swift
//  Sabify
//
//  Created by Sabrina De Crescenzo on 21/11/23.
//

import Foundation
import SwiftData
import SwiftUI
import UIKit

struct SearchPageView: View {
    var collections: [Collection] = collectionData
    @State private var query: String = ""
        
    var body: some View {
        
        
        NavigationStack {
            
            ZStack {
                //MARK: Background
                
                Rectangle()
                    .fill(.nerino)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    Text ("Browse all")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.trailing, 260)
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                    
                    LazyVGrid(columns: [GridItem(spacing: 0),  GridItem(.flexible(), spacing: 10),], spacing: 15){
                        ForEach(collections) { collection in
                          
                            VStack {
                                Image (collection.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 180, height: 110)
                                        .cornerRadius(6.0)
                                        
                                        .overlay(
                                            Text (collection.title)
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .padding(),
                                            alignment: .topLeading)
                            } .accessibilityElement()
                        }
                    }
                }
                
            }
            
            
            //.navigationTitle("Search")
            
//            .navigationBarItems(trailing: Image(systemName: "camera")
//                .foregroundColor(.grigino))
//            
//            .searchable(text: $searchText)
            .toolbar {
//                ToolbarItemGroup (placement: .topBarTrailing) {
//                    HStack {
//                        Text("Search")
//                            .foregroundStyle(Color(.white))
//                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                            .font(.title)
//                       
//                        Image(systemName: "camera")
//                            .foregroundColor(.grigino)
//                            //.padding(.leading, 220)
//                    }
//                }
                
                ToolbarItemGroup (placement: .navigation){
                    VStack {
                        
                        HStack {
                            Image("FotoProfilo")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width:30, height:30)
                            Text("Search")
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                        }
                    } .searchable(text: $query) {
                      
                    }
                }
                ToolbarItem {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width:20, height:15)
                        .foregroundColor(.white)
                        .accessibilityRemoveTraits(.isImage)
                    
                }
        }
            .toolbar(.automatic, for: .navigationBar)
            
        }
    }
}

#Preview {
    SearchPageView()
//            let config = ModelConfiguration(isStoredInMemoryOnly: true)
//            let container = try! ModelContainer(for: Album.self, configurations: config)
//            
//            return SearchPage()
//                .modelContainer(container)
        }
