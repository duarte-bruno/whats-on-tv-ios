//
//  UIColor+ExtensionsTests.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import XCTest

final class UIColor_ExtensionsTests: XCTestCase {

    func testInitializationWithHexString() throws {
        let color = UIColor(hex: "#000000")
        XCTAssertEqual(color.cgColor.components, [0.0, 0.0, 0.0, 1.0])
    }

    func testInitializationWithHexStringWithoutHashtag() throws {
        let color = UIColor(hex: "000000")
        XCTAssertEqual(color.cgColor.components, [0.0, 0.0, 0.0, 1.0])
    }
    
    func testInitializationWithHexStringAndAlphaZero() throws {
        let color = UIColor(hex: "#00000000")
        XCTAssertEqual(color.cgColor.components, [0.0, 0.0, 0.0, 0.0])
    }
    
    func testUIColorConvertionToHexString() throws {
        let color = UIColor(hex: "#000000")
        XCTAssertEqual(color.toHexString(), "#000000")
    }
    
    func testUIColorConvertionToHexStringWithAlpha() throws {
        let color = UIColor(hex: "#00000000")
        XCTAssertEqual(color.toHexString(withAlpha: true), "#00000000")
    }
}
