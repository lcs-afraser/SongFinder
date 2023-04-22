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
    
    //MARK: Computed properties
    var body: some View {
        //Show a list of songs that match the search term
        List(foundSongs, id: \.trackId) { currentSong in
            VStack {
                Text(currentSong.trackName)
                    .bold()
                Text(currentSong.artistName)
            }
        }
        .task {
            //When the view apepars, fetch search results for "anti-hero"
            foundSongs = await NetworkService.fetch()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
