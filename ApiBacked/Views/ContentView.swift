//
//  ContentView.swift
//  ApiBacked
//
//  Created by Julian Mazzier on 2/20/24.
//

import SwiftUI


struct ContentView: View {
    @State var searchText = ""
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Search Song", text: $searchText)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if searchText == "" {
                Button("Need Help?"){
                    withAnimation(.smooth){
                        isAnimated.toggle()

                    }
                                }
                Spacer()
                RoundedRectangle(cornerRadius:50)
                    .fill(isAnimated ? Color.blue : Color.white)
                    .frame(
                        width: isAnimated ? 300 : 0,
                        height: isAnimated ? 300 : 0)
                    
                
                Text("Type in a song to see relevant results. Click on any song to see more from that album. Go back at anytime or search for other songs.")
                    .multilineTextAlignment(.center)
                    .frame(width: nil)
                    .foregroundStyle(.white)
                    .offset(CGSize(width: 0, height: -266))
                    .padding(60)
                
            } else {
                
                ListView(searchTerm: searchText, searchEntity: "song")
            }
            Spacer()
        }
        
    }
}   

#Preview {
    ContentView()
}
