//
//  StrEpisodesList.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation
import WotCore

public enum StrEpisodesList: String, WotLocalizeable {
    
    public var l: String {
        get {
            return "StrEpisodesList.\(self.rawValue)".l()
        }
    }
    
    case Title
    case Season
}
