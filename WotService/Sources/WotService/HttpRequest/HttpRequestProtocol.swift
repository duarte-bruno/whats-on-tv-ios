//
//  HttpRequest.swift
//  
//
//  Created by Bruno Duarte on 26/06/23.
//

import Foundation

public protocol HttpRequestProtocol {
    
    /// Init with a specific subclass of URLProtocol protocol if needed
    /// - Parameter urlProtocol: URLProtocol subclass
    init(urlProtocol: URLProtocol?)
}

public protocol GetHttpRequestProtocol: HttpRequestProtocol {
    
    /// GET HTTP Request
    /// - Parameters:
    ///   - params: Request params
    ///   - completion: Completion response
    func get<T: Codable>(_ params: HttpParams, completion: @escaping (Result<T, HttpError>) -> Void)
}
