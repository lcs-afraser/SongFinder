//
//  Song.swift
//  SongFinder
//
//  Created by Alistair Fraser on 2023-04-22.
//

import Foundation

struct Song: Codable {
    let trackId: Int
    let artistName: String
    let collectionName: String
    let trackName: String
    let artistViewUrl: String
    let collectionViewUrl: String
    let previewUrl: String
    let artworkUrl100: String
}
