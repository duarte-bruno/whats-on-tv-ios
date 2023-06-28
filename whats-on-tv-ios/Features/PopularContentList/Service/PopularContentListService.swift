//
//  PopularContentListService.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 27/06/23.
//

import Foundation
import WotService

protocol PopularContentListServiceProtocol {
    
    init(_ request: HttpRequest)
    
    func getPopularContent(completion: @escaping (Result<[Content], HttpError>) -> Void)
}

class PopularContentListService: PopularContentListServiceProtocol {
    private let request: HttpRequest
    
    required init(_ request: HttpRequest) {
        self.request = request
    }
    
    func getPopularContent(completion: @escaping (Result<[Content], HttpError>) -> Void) {
        let params = HttpParams(path: "shows")
        request.get(params, completion: completion)
    }
}
