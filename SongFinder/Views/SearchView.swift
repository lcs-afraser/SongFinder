//
//  SearchView.swift
//  SongFinder
//
//  Created by Alistair Fraser on 2023-04-22.
//

import SwiftUI

struct SearchView: View {
    
    //MARK: Stored propeties
    
    //Holds the list of songs returned by our search
    @State var foundSongs: [Song] = []
    
    //Holds the song name the user is searching on
    @State var searchText = ""
    
    //MARK: Computed properties
    var body: some View {
        NavigationView {
            List(foundSongs, id: \.trackId) { currentSong in
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(currentSong.trackName)
                            .bold()
                        Spacer()
                    }
                    Text(currentSong.collectionName)
                        .italic()
                    Text(currentSong.artistName)
                }
            }
            .searchable(text: $searchText)
            .task {
                //When the view apepars, fetch search results for a song of our choice
                foundSongs = await NetworkService.fetch(resultsFor: "as it was")
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
