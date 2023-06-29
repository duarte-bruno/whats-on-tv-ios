//
//  Content.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation

// MARK: - List Content

struct Content: Codable {
    let id: Int
    let name: String
    let image: Image?
}

struct Image: Codable {
    let medium, original: String?
}

// MARK: - Search Content

struct ContentSearch: Codable {
    let score: Float
    let show: Content
}

// MARK: - Detail Content

struct ContentDetail: Codable {
    let id: Int
    let name: String
    let image: Image?
    let genres: [String]
    let schedule: Schedule
    let summary: String
    let averageRuntime: Int
    let status: String
    var seasons: [Season]?
    var _embedded: Embedded?
}

struct Schedule: Codable {
    let time: String
    let days: [String]
}

struct Embedded: Codable {
    let episodes: [Episode]?
    let seasons: [Season]?
}
