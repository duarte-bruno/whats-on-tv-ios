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
    
    func getPopularContent(pageIndex: Int, completion: @escaping (Result<[Content], HttpError>) -> Void)
}

class PopularContentListService: PopularContentListServiceProtocol {
    private let request: HttpRequest
    
    required init(_ request: HttpRequest) {
        self.request = request
    }
    
    func getPopularContent(pageIndex: Int = 0, completion: @escaping (Result<[Content], HttpError>) -> Void) {
        let params = HttpParams(path: "shows", queryParams: ["page": String(pageIndex)])
        request.get(params, completion: completion)
    }
}
