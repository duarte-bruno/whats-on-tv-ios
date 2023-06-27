//
//  HttpRequest.swift
//  
//
//  Created by Bruno Duarte on 26/06/23.
//

import Foundation

public protocol GetHttpRequestProtocol {
    
    /// GET HTTP Request
    /// - Parameters:
    ///   - params: Request params
    ///   - completion: Completion response
    func get<T: Codable>(_ params: HttpParams, completion: @escaping (Result<T, HttpError>) -> Void)
}
