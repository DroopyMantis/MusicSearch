//
//  SongDetail.swift
//  ApiBacked
//
//  Created by Julian Mazzier on 2/20/24.
//

import SwiftUI

struct SongDetail: View {
    var result : SearchResult
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: result.artworkUrl100 ?? "")) {
                    image in image
                } placeholder: {
                    ProgressView()
                }
                VStack {
                    Text(result.trackName)
                        .font(.title)
                        .bold()
                    
                    Text(result.artistName)
                        .font(.headline)
                    HStack {
                        Text(result.collectionName!)
                    }
                }
            }
        }
        Spacer()
        Text("More from collection")
            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
        ListView(searchTerm: result.collectionName!, searchEntity: "song")
    }
}

#Preview {
    SongDetail(result: SearchResult(
        trackId: 1441133834,
        trackName: "Blackbird",
        collectionName: "The Beatles (The White Album)",
        artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/99/4f/5f/994f5f40-a842-4dc7-58d4-a0210ae09c8c/dj.rengmjbv.jpg/100x100bb.jpg",
        artistName: "The Beatles"
    ))
}

    

