//
//  WotColorTheme.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation

public final class WotColorTheme: WotColorThemeProtocol {
    
    public var primary: WotColor { return WotColor(tint: "FB8500", subtle: "FFB703") }
    
    public var secondary: WotColor { return WotColor(tint: "219EBC", subtle: "8ECAE6") }
    
    public var tertiary: WotColor { return WotColor(tint: "023047", subtle: "044362") }
    
    public var light: WotColor { return WotColor(tint: "FFFFFF", subtle: "E0E0E0") }
    
    public var dark: WotColor { return WotColor(tint: "1F1F1F", subtle: "3D3D3D") }
    
    public static var shared: WotColorTheme = WotColorTheme()
    
    private init() {}
}
