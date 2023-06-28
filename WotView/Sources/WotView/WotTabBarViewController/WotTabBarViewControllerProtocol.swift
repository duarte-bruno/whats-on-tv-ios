//
//  WotTabBarViewControllerProtocol.swift
//  
//
//  Created by Bruno Duarte on 27/06/23.
//

import UIKit
import WotCore

public protocol WotTabBarViewControllerProtocol: UITabBarController {
    
    /// Initialize the TabViewController with a list of coordinators
    /// - Parameters:
    ///   - coordinators: Coordinators in the exact tab order
    ///   - initialSelectedIndex: Initial selected coordinator
    init(coordinators: [WotCoordinator], initialSelectedIndex: Int)
}
