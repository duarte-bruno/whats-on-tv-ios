//
//  ContentSearchCoordinator.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotCore
import WotView
import WotService

class ContentSearchCoordinator: WotCoordinator {
    
    // MARK: - Public properties
    
    let httpRequest: HttpRequest
    
    var initialController: UIViewController {
        return navigationController
    }
    
    // MARK: - Private properties
    
    private let navigationController: WotNavigationController
    private var title: String {
        return StrContentSearch.Title.l
    }
    
    private enum Screen {
        case contentSearch
    }
    
    // MARK: - Init
    
    init() {
        self.navigationController = WotNavigationController()
        self.httpRequest = HttpRequest()
        
        setupTabBarItem()
        setupNavigation()
    }
    
    // MARK: - Private methods
    
    private func setupTabBarItem() {
        let item = UITabBarItem(
            title: title,
            image: UIImage(systemName: "magnifyingglass.circle"),
            selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        navigationController.tabBarItem = item
    }
    
    private func setupNavigation() {
        navigationController.viewControllers = [getScreen(.contentSearch)]
        navigationController.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController.navigationBar.titleTextAttributes = textAttributes
        navigationController.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController.navigationBar.barStyle = .default
        navigationController.navigationBar.tintColor = .black
    }
    
    private func getScreen(_ screen: Screen) -> UIViewController {
        switch screen {
        case .contentSearch:
            let viewModel = ContentSearchViewModel(delegate: self)
            let controller = ContentSearchViewController(viewModel: viewModel)
            return controller
        }
    }
}
