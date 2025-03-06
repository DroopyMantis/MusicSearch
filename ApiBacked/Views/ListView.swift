//
//  ListView.swift
//  ApiBacked
//
//  Created by Julian Mazzier on 2/20/24.
//

import SwiftUI

struct ListView: View {
    var searchTerm: String
    var searchEntity: String
    
    @State var loading = false
    @State var errorOccured = false
    @State var results: [SearchResult] = []
    
    var body: some View {
        NavigationStack{
                if loading {
                    ProgressView()
                } else if errorOccured {
                    Text("Sorry, someting went wrong. :(")
                } else {
                    List(results, id: \.trackId) {
                        item in NavigationLink {
                            SongDetail(result: item)
                        } label: {
                            ResultRow(result: item)
                        }
                    } .refreshable {
                        await loadSearchResults()
                    }
                }
        }
        .task(id: searchTerm) {
            await loadSearchResults()
        }
    }
    
    func loadSearchResults() async {
        errorOccured = false
        loading = true
        
        do {
            let searchPage = try await search(term: searchTerm, entity: searchEntity)
            results = searchPage.results
        } catch {
            errorOccured = true
            
            debugPrint("Unexpected error: \(error)")
        }
        
        loading = false
    }
}
    
#Preview {
    ListView(searchTerm: "Dancing", searchEntity: "song")
}
