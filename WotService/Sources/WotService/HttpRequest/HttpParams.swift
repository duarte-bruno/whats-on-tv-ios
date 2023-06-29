//
//  HttpParams.swift
//  
//
//  Created by Bruno Duarte on 27/06/23.
//

import Foundation

public struct HttpParams {
    
    // MARK: - public properties
    
    /// URL path after the base URL (this path should not start with "/")
    public let path: String
    /// Query string params
    public let queryParams: [String: String]?
    
    // MARK: - init
    
    public init(path: String, queryParams: [String : String]? = nil) {
        self.path = path
        self.queryParams = queryParams
    }
    
    // MARK: - public methods
    
    /// Create an URL for this params
    /// - Returns: The created URL
    public func createUrl() -> URL? {
        var urlComponents = URLComponents(string: WotService.shared.baseUrl + path)
        
        if let params = queryParams {
            var urlQueryParams = [URLQueryItem]()
            
            if let first = params.first, first.key.contains("[]") {
                var queryParam = ""
                let values = first.value.components(separatedBy: ",")
                for value in values {
                    queryParam = "\(queryParam)"
                    urlQueryParams.append(URLQueryItem(name: first.key, value: value))
                }
            } else {
                for queryParam in params {
                    urlQueryParams.append(URLQueryItem(name: queryParam.key, value: queryParam.value))
                }
            }

            urlComponents?.queryItems = urlQueryParams
        }

        return urlComponents?.url
    }
}

