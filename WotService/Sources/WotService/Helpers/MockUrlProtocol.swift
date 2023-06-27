//
//  MockUrlProtocol.swift
//  
//
//  Created by Bruno Duarte on 27/06/23.
//

import Foundation

/// Mock URLSession calls returning a specific data for a specific URL path
public class MockUrlProtocol: URLProtocol {

    public override class func canInit(with task: URLSessionTask) -> Bool {
        return true
    }

    public override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    public override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    public override func startLoading() {
        if let url = request.url {
            let path: String
            if let queryString = url.query {
                path = url.relativePath + "?" + queryString
            } else {
                path = url.relativePath
            }
            guard let data = MockUrl.shared.mockedData[path] else {
                client?.urlProtocolDidFinishLoading(self)
                return
            }
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocol(self, didReceive: HTTPURLResponse(), cacheStoragePolicy: .allowed)
        }
        client?.urlProtocolDidFinishLoading(self)
    }

    public override func stopLoading() {}
}

/// A singleton with mocked data to be used in MockUrlProtocol
public class MockUrl {
    
    /// A dictionary of mock data, where keys are URL path eg. "/weather?country=SG"
    public var mockedData: [String: Data]
    
    public static var shared: MockUrl = MockUrl()
    
    private init() {
        self.mockedData = [String: Data]()
    }
}
