//
//  WotTabBarViewController.swift
//  
//
//  Created by Bruno Duarte on 27/06/23.
//

import UIKit
import WotCore

public class WotTabBarViewController: UITabBarController, WotTabBarViewControllerProtocol {
    
    // MARK: - Private properties
    
    private let coordinators: [WotCoordinator]
    private var initialSelectedIndex: Int
    
    // MARK: - Init
    
    public required init(coordinators: [WotCoordinator], initialSelectedIndex: Int = 0) {
        self.coordinators = coordinators
        self.initialSelectedIndex = initialSelectedIndex
        
        super.init(nibName: nil, bundle: nil)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    // MARK: - Private methods
    
    private func setup() {
        self.viewControllers = createControlerList()
        self.selectedViewController = getSelectedController()
        self.selectedIndex = initialSelectedIndex
        self.tabBar.barStyle = .default
        self.tabBar.tintColor = .orange
        self.tabBar.unselectedItemTintColor = .black
    }
    
    private func createControlerList() -> [UIViewController] {
        var controllers: [UIViewController] = []
        for coordinator in coordinators {
            controllers.append(coordinator.initialController)
        }
        return controllers
    }
    
    private func getSelectedController() -> UIViewController {
        if 0...coordinators.count - 1 ~= initialSelectedIndex {
            return coordinators[initialSelectedIndex].initialController
        } else {
            initialSelectedIndex = 0
            return coordinators[initialSelectedIndex].initialController
        }
    }
}
