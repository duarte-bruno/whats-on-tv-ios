//
//  StrPopularContentList.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation
import WotCore

public enum StrPopularContentList: String, WotLocalizeable {
    
    public var l: String {
        get {
            return "StrPopularContentList.\(self.rawValue)".l()
        }
    }
    
    case Title
}
