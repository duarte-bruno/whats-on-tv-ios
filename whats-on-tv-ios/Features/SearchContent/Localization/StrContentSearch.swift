//
//  StrContentSearch.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation
import WotCore

public enum StrContentSearch: String, WotLocalizeable {
    
    public var l: String {
        get {
            return "StrContentSearch.\(self.rawValue)".l()
        }
    }
    
    case Title
    case TypeYourSearch
}
