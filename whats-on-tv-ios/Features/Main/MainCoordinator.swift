//
//  MainCoordinator.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 27/06/23.
//

import UIKit
import WotCore
import WotView

class MainCoordinator: WotCoordinator {
    
    // MARK: - Public properties
    
    var initialController: UIViewController {
        return tabBarViewController ?? UIViewController()
    }
    
    // MARK: - Private properties
    
    private var tabBarViewController: WotTabBarViewControllerProtocol? = nil
    private var popularContentListCoordinator: PopularContentListCoordinator? = nil
    private var contentSearchCoordinator: ContentSearchCoordinator? = nil
    
    // MARK: - Initialization
    
    init() {
        setupCoordinators()
        setupTabBarController()
    }
    
    // MARK: - Private methods
    
    private func setupCoordinators() {
        self.popularContentListCoordinator = PopularContentListCoordinator()
        self.contentSearchCoordinator = ContentSearchCoordinator()
    }
    
    private func setupTabBarController() {
        guard
            let popularContentListCoordinator,
            let contentSearchCoordinator
        else { return }
        
        self.tabBarViewController = WotTabBarViewController(coordinators: [
            popularContentListCoordinator,
            contentSearchCoordinator
        ])
    }
}
