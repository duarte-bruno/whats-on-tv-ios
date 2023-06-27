//
//  WotServiceTests.swift
//
//
//  Created by Bruno Duarte on 27/06/23.
//

import XCTest
@testable import WotService

final class WotServiceTests: XCTestCase {
    
    func test_configureBaseUrl_shouldChange() throws {
        let baseUrl = "http://www.test.com/"
        
        WotService.shared.configure(baseUrl: baseUrl)
        XCTAssertEqual(WotService.shared.baseUrl, baseUrl)
    }
    
    func test_configureBundle_shouldChange() throws {
        let bundle = Bundle.main
        
        WotService.shared.configure(bundle: bundle)
        XCTAssertEqual(WotService.shared.bundle, bundle)
    }
}
