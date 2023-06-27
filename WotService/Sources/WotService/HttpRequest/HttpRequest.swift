//
//  HttpRequest.swift
//  
//
//  Created by Bruno Duarte on 26/06/23.
//

import Foundation

public class HttpRequest: GetHttpRequestProtocol {
    
    // MARK: - public methods
    
    public func get<T: Codable>(_ params: HttpParams, completion: @escaping (Result<T, HttpError>) -> Void) {
        guard let url = createUrl(params) else {
            completion(.failure(.invalidPath))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
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
    
    // MARK: - private methods
    
    /// Create an URL for HTTP request
    /// - Parameter params: Request params
    /// - Returns: The created URL
    private func createUrl(_ params: HttpParams) -> URL? {
        var queryParams = [URLQueryItem]()
        
        for queryParam in params.queryParams ?? [:] {
            queryParams.append(URLQueryItem(name: queryParam.key, value: queryParam.value))
        }

        var urlComponents = URLComponents(string: WotService.shared.baseUrl + params.path)
        urlComponents?.queryItems = queryParams
        return urlComponents?.url
    }
}
