//
//  StrError.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation

public enum StrError: String, WotLocalizeable {
    
    public var l: String {
        get {
            return "StrError.\(self.rawValue)".l()
        }
    }
    
    case InitCoderNotImplemented
}
