//
//  StrGeneric.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation

public enum StrGeneric: String, WotLocalizeable {
    
    public var l: String {
        get {
            return "StrGeneric.\(self.rawValue)".l()
        }
    }
    
    case Ok
    case Ops
}
