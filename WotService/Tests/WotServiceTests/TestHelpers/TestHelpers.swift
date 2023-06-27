//
//  TestHelpers.swift
//  
//
//  Created by Bruno Duarte on 27/06/23.
//

import Foundation

class TestHelpers {
    
    // MARK: - public methods
    
    static func getBundle() -> Bundle {
        guard let identifier = Bundle.module.bundleIdentifier, let bundle = Bundle(identifier: identifier) else { return Bundle.main }
        return bundle
    }
}
