//
//  PopularContentListCoordinator.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 27/06/23.
//

import UIKit
import WotCore

class PopularContentListCoordinator: WotCoordinator {
    
    // MARK: - Public properties
    
    var initialController: UIViewController {
        return navigationController
    }
    
    // MARK: - Private properties
    
    private let navigationController: UINavigationController
    private var title: String {
        return "Popular"
    }
    
    // MARK: - Init
    
    init() {
        self.navigationController = UINavigationController()
        
        setupTabBarItem()
        setupNavigation()
    }
    
    // MARK: - Private methods
    
    private func setupTabBarItem() {
        let listComicsItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: "person.2.crop.square.stack"),
            selectedImage: UIImage(systemName: "person.2.crop.square.stack.fill"))
        navigationController.tabBarItem = listComicsItem
    }
    
    private func setupNavigation() {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        controller.title = title
        
        navigationController.viewControllers = [controller]
        navigationController.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController.navigationBar.titleTextAttributes = textAttributes
        navigationController.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController.navigationBar.barStyle = .default
        navigationController.navigationBar.tintColor = .black
    }
}