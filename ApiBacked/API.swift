//
//  API.swift
//  ApiBacked
//
//  Created by Julian Mazzier on 2/20/24.
//

import Foundation

let ITUNES_API_ROOT = "https://itunes.apple.com"
let SEARCH_ENDPOINT = "\(ITUNES_API_ROOT)/search"

enum APIError: Error {
    case unsuccessfulDecode
}

func search(term: String, entity: String) async throws -> SearchPage{
    guard let url = URL(string: "\(SEARCH_ENDPOINT)?term=\(term)&entity=\(entity)") else {
        fatalError("Bad URL")
    }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedPage = try? JSONDecoder().decode(SearchPage.self, from: data) {
        return decodedPage
    } else {
        throw APIError.unsuccessfulDecode
    }
}
