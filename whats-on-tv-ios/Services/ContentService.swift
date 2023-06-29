//
//  ContentService.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation
import WotService

protocol ContentServiceProtocol {
    
    init(_ request: HttpRequest)
    
    func getPopularContent(pageIndex: Int, completion: @escaping (Result<[Content], HttpError>) -> Void)
    func searchContent(search: String, completion: @escaping (Result<[ContentSearch], HttpError>) -> Void)
}

class ContentService: ContentServiceProtocol {
    private let request: HttpRequest
    
    required init(_ request: HttpRequest) {
        self.request = request
    }
    
    func getPopularContent(pageIndex: Int = 0, completion: @escaping (Result<[Content], HttpError>) -> Void) {
        let params = HttpParams(path: "shows", queryParams: ["page": String(pageIndex)])
        request.get(params, completion: completion)
    }
    
    func searchContent(search: String, completion: @escaping (Result<[ContentSearch], HttpError>) -> Void) {
        let params = HttpParams(path: "search/shows", queryParams: ["q": search])
        request.get(params, completion: completion)
    }
}
