//
//  WotThemeProtocol.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation

public protocol WotThemeProtocol: AnyObject {
    
    // MARK: - properties
    
    var color: WotColorThemeProtocol { get }
    
    /// Shared instance of this class
    static var shared: Self { get }
    
    // MARK: - methods
    
    /// Setup the project's theme
    /// - Parameters:
    ///   - color: Color theme
    func setupTheme(color: WotColorThemeProtocol)
}
