//
//  HttpRequest.swift
//  
//
//  Created by Bruno Duarte on 26/06/23.
//

import Foundation

public class HttpRequest: GetHttpRequestProtocol {
    
    // MARK: - private properties
    
    private let session: URLSession
    
    // MARK: - init
    
    public required init(urlProtocol: URLProtocol? = nil) {
        if let urlProtocol = urlProtocol {
            URLProtocol.registerClass(urlProtocol.classForCoder)
            
            let configuration = URLSessionConfiguration.default
            configuration.protocolClasses?.insert(urlProtocol.classForCoder, at: 0)
            
            session = URLSession(configuration: configuration)
        } else {
            session = URLSession.shared
        }
    }
    
    // MARK: - public methods
    
    public func get<T: Codable>(_ params: HttpParams, completion: @escaping (Result<T, HttpError>) -> Void) {
        guard let url = params.createUrl() else {
            completion(.failure(.invalidPath))
            return
        }

        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(.transportError(error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.unexpected))
                return
            }

            guard (200..<300) ~= response.statusCode else {
                completion(.failure(.serverSideError(response.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.serialization))
                return
            }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(.success(object))
            } catch {
                completion(.failure(.serialization))
                return
            }
        }
        task.resume()
    }
}
