//
//  StrContentDetail.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation
import WotCore

public enum StrContentDetail: String, WotLocalizeable {
    
    public var l: String {
        get {
            return "StrContentDetail.\(self.rawValue)".l()
        }
    }
    
    case Title
    case Schedule
    case SeeEpisodesList
}
