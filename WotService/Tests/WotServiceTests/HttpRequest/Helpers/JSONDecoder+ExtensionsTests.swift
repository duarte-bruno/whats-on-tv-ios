//
//  JSONDecoder+ExtensionsTests.swift
//  
//
//  Created by Bruno Duarte on 27/06/23.
//

import XCTest
@testable import WotService

final class JSONDecoder_ExtensionsTests: XCTestCase {

    func test_getDataFrom_shouldReturnJsonFileData() throws {
        let jsonData = JSONDecoder.getDataFrom(jsonFile: "GetResponseMock", bundle: TestHelpers.getBundle())
        XCTAssertNotNil(jsonData)
    }
    
    func test_getDataFrom_shouldReturnNil() throws {
        let jsonData = JSONDecoder.getDataFrom(jsonFile: "NoFile", bundle: TestHelpers.getBundle())
        XCTAssertNil(jsonData)
    }
}
