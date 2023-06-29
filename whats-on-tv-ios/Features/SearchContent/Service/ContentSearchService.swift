//
//  ContentSearchService.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation
import WotService

protocol ContentSearchServiceProtocol {
    
    init(_ request: HttpRequest)
    
    func searchContent(search: String, completion: @escaping (Result<[ContentSearch], HttpError>) -> Void)
}

class ContentSearchService: ContentSearchServiceProtocol {
    private let request: HttpRequest
    
    required init(_ request: HttpRequest) {
        self.request = request
    }
    
    func searchContent(search: String, completion: @escaping (Result<[ContentSearch], HttpError>) -> Void) {
        let params = HttpParams(path: "search/shows", queryParams: ["q": search])
        request.get(params, completion: completion)
    }
}