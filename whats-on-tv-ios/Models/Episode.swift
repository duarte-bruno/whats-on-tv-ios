//
//  Episode.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let number: Int
    let season: Int
    let summary: String
    let image: Image?
}
