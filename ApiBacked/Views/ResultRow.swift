//
//  ResultRow.swift
//  ApiBacked
//
//  Created by Julian Mazzier on 2/20/24.
//

import SwiftUI

let ARTWORK_HEIGHT = 60.0

struct ResultRow: View {
    var result : SearchResult
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: result.artworkUrl60 ?? "")) {
                image in image
            } placeholder: {
                ProgressView()
            }
            .frame(height: ARTWORK_HEIGHT)
            VStack {
                HStack {
                    Text(result.trackName)
                        .font(.headline)
                    Spacer()
                    Text(result.artistName)
                        .font(.subheadline)
                }
                HStack {
                    Text(result.collectionName!)
                        .font(.footnote)
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ResultRow(result: SearchResult(
        trackId: 1441133834,
        trackName: "Blackbird",
        collectionName: "The Beatles (The White Album)",
        artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/fa/5b/89/fa5b898d-bad6-e053-4195-260e5c74f2bb/00602567725466.rgb.jpg/60x60bb.jpg",
        artistName: "The Beatles"
    ))
}
 
