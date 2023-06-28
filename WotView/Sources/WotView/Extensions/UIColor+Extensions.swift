//
//  UIColor+Extensions.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import UIKit

extension UIColor {
    
    /// Convert a hex string to UIColor. If fails the initialized color will be UIColor.clear
    /// - Parameters:
    ///   - hex: Hex color string
    public convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var color: UInt32 = 0
        let scanner = Scanner(string: hex)
        scanner.scanHexInt32(&color)
        
        var rgb: UInt32 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else {
            self.init(ciColor: .clear)
            return
        }
        
        switch hexSanitized.count {
        case 6:
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        case 8:
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
        default:
            self.init(ciColor: .clear)
            return
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    /// Convert UIColor to hex string
    /// - Parameter withAlpha: Show hex with alpha value
    /// - Returns: Hex string
    public func toHexString(withAlpha: Bool = false) -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        if withAlpha {
            let rgb:Int = (Int)(r*255)<<24 | (Int)(g*255)<<16 | (Int)(b*255)<<8 | (Int)(a*255)
            
            return String(format:"#%08x", rgb)
        } else {
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            
            return String(format:"#%06x", rgb)
        }
    }
}
