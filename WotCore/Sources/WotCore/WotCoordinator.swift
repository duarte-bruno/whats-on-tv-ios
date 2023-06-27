//
//  WotCoordinator.swift
//  
//
//  Created by Bruno Duarte on 27/06/23.
//

import UIKit

/// This is the app's navigation coordinattor
public protocol WotCoordinator {
    
    /// Initial coordinator controller
    var initialController: UIViewController { get }
}
