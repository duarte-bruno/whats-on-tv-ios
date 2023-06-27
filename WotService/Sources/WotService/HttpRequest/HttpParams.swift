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
    
    // MARK: - public methods
    
    /// Create an URL for this params
    /// - Returns: The created URL
    public func createUrl() -> URL? {
        var urlComponents = URLComponents(string: WotService.shared.baseUrl + path)
        
        if let params = queryParams {
            var urlQueryParams = [URLQueryItem]()
            
            for queryParam in params {
                urlQueryParams.append(URLQueryItem(name: queryParam.key, value: queryParam.value))
            }
            
            urlComponents?.queryItems = urlQueryParams
        }

        return urlComponents?.url
    }
}
