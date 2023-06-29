//
//  WotTheme.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation

public final class WotTheme: WotThemeProtocol {
    
    // MARK: - public properties
    
    public var color: WotColorThemeProtocol
    
    public static var shared: WotTheme = WotTheme()
    
    // MARK: - init
    
    private init() {
        self.color = WotColorTheme.shared
    }
    
    // MARK: - public methods
    
    public func setupTheme(color: WotColorThemeProtocol = WotColorTheme.shared) {
        self.color = color
    }
}
