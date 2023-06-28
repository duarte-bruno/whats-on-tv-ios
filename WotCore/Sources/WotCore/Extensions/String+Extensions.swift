//
//  String+Extensions.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation

public extension String {
    
    /// Localize the String to device language
    /// - Parameter comment: A note to the translator describing the context where the localized string is presented to the user.
    /// - Returns: Localized String
    func l(comment: String = "") -> String {
        let defaultLanguage = "en"
        
        let value = NSLocalizedString(self, comment: comment)
        if value != self || NSLocale.preferredLanguages.first == defaultLanguage {
            return value
        }
        
        guard let path = Bundle.main.path(forResource: defaultLanguage, ofType: "lproj"), let bundle = Bundle(path: path) else {
            return value
        }

        return NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
