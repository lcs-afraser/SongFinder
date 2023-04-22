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
                NavigationLink(destination: {
                    SongDetailView(songToShow: currentSong)
                }, label: {
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
                })
              
            }
            .navigationTitle("Song Finder")
            .searchable(text: $searchText)
            .onChange(of: searchText) { newSearchText in
                Task {
                    //Fetch search results for whatever the user would like
                    foundSongs = await NetworkService.fetch(resultsFor: searchText)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
