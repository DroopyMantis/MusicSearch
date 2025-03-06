//
//  Model.swift
//  ApiBacked
//
//  Created by Julian Mazzier on 2/20/24.
//

import Foundation

struct SearchResult: Hashable, Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var artistName: String
}

struct SearchPage: Hashable, Codable {
    var resultCount: Int
    var results: [SearchResult]
}
