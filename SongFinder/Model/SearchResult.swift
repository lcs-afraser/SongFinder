//
//  SearchResult.swift
//  SongFinder
//
//  Created by Alistair Fraser on 2023-04-22.
//

import Foundation

struct SearchResult: Codable {
    let resultCount: Int
    let results: [Song]
}


