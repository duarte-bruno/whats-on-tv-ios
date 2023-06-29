//
//  Season.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation

struct Season: Codable {
    let id: Int
    let number: Int
    let image: Image?
    let episodes: [Episode]?
}
