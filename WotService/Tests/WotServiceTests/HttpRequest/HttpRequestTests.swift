//
//  HttpRequestTests.swift
//  
//
//  Created by Bruno Duarte on 27/06/23.
//

import XCTest
@testable import WotService

final class HttpRequestTests: XCTestCase {
    
    // MARK: - private properties
    
    private let baseUrl = "http://www.test.com/"
    
    // MARK: - tests

    func test_httpRequestGet_shouldGetResposeWithSuccess() throws {
        WotService.shared.configure(baseUrl: baseUrl)
        let params = HttpParams(path: "gettest", queryParams: nil)
        
        guard let jsonMock = JSONDecoder.getDataFrom(jsonFile: "GetResponseMock", bundle: TestHelpers.getBundle()) else {
            XCTFail("GetResponseMock can't be found.")
            return
        }
        MockUrl.shared.mockedData = [params.createUrl()?.relativePath ?? "": jsonMock]
        
        let request = HttpRequest(urlProtocol: MockUrlProtocol())
        let expectation = self.expectation(description: "getMockExpectation")
        var getResultModel: GetResult? = nil
        
        getMockResult(request: request, params: params) { result in
            switch result {
            case .success(let getResult):
                getResultModel = getResult
            case .failure(let error):
                XCTFail(error.description)
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNotNil(getResultModel)
    }
    
    func test_httpRequestGet_shouldGetResposeWithSpecificModelResult() throws {
        WotService.shared.configure(baseUrl: baseUrl)
        let params = HttpParams(path: "gettest", queryParams: nil)
        
        guard let jsonMock = JSONDecoder.getDataFrom(jsonFile: "GetResponseMock", bundle: TestHelpers.getBundle()) else {
            XCTFail("GetResponseMock can't be found.")
            return
        }
        MockUrl.shared.mockedData = [params.createUrl()?.relativePath ?? "": jsonMock]
        
        let request = HttpRequest(urlProtocol: MockUrlProtocol())
        let expectation = self.expectation(description: "getMockExpectation")
        var getResultModel: GetResult? = nil
        
        getMockResult(request: request, params: params) { result in
            switch result {
            case .success(let getResult):
                getResultModel = getResult
            case .failure(let error):
                XCTFail(error.description)
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        do {
            let jsonMockModel = try JSONDecoder().decode(GetResult.self, from: jsonMock)
            XCTAssertEqual(getResultModel, jsonMockModel)
        } catch {
            XCTFail("can't parse GetResponseMock data.")
            return
        }
    }
    
    // MARK: - private methods
    
    private func getMockResult(request: HttpRequest, params: HttpParams,completion: @escaping (Result<GetResult, HttpError>) -> Void) {
        request.get(params, completion: completion)
    }
}

// MARK: - mock results

struct GetResult: Codable, Equatable {
    let id: Int
    let name: String
}
