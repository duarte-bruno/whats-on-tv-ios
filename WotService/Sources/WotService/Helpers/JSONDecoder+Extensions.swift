//
//  JSONDecoder+Extensions.swift
//  
//
//  Created by Bruno Duarte on 27/06/23.
//

import Foundation

public extension JSONDecoder {
    
    /// Get the content of a JSON file
    /// - Parameter jsonFile: File name without .json sufix
    /// - Parameter bundle: A custom bundle to be used
    /// - Returns: Returns nil if the file cannot be read
    static func getDataFrom(jsonFile: String, bundle: Bundle = Bundle.main) -> Data? {
        guard let url = bundle.url(forResource: jsonFile, withExtension: "json") else { return nil }

        do {
            return try Data(contentsOf: url, options: .mappedIfSafe)
        } catch {
            return nil
        }
    }
}
