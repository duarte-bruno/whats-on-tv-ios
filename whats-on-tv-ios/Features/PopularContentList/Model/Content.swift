//
//  Content.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation

struct Content: Codable {
    let id: Int
    let name: String
    let image: Image?
}

struct Image: Codable {
    let medium, original: String?
}
