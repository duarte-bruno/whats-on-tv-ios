//
//  WotColorThemeProtocol.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import UIKit

/// Base project color theme (recomended to use as a singleton)
public protocol WotColorThemeProtocol: AnyObject {
    
    /// Main theme color
    var primary: WotColor { get }
    
    /// Contrast theme color
    var secondary: WotColor { get }
    
    /// Color to give more contrast with primary and secondary colors
    var tertiary: WotColor { get }
    
    /// Light colors
    var light: WotColor { get }
    
    /// Dark colors
    var dark: WotColor { get }
    
    /// Shared instance of this class
    static var shared: Self { get }
}

/// Base color with one variation
public class WotColor {
    public let tint: UIColor
    public let subtle: UIColor
    
    init(tint: String, subtle: String) {
        self.tint = UIColor(hex: tint)
        self.subtle = UIColor(hex: subtle)
    }
}
