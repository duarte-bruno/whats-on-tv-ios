//
//  PopularContentListCoordinator.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 27/06/23.
//

import UIKit
import WotCore
import WotView
import WotService

class PopularContentListCoordinator: WotCoordinator {
    
    // MARK: - Public properties
    
    let httpRequest: HttpRequest
    
    var initialController: UIViewController {
        return navigationController
    }
    
    // MARK: - Private properties
    
    private let navigationController: WotNavigationController
    private var title: String {
        return StrPopularContentList.Title.l
    }
    
    enum Screen {
        case popularContentList
        case contentDetail(_ content: Content)
    }
    
    // MARK: - Init
    
    init() {
        self.navigationController = WotNavigationController()
        self.httpRequest = HttpRequest()
        
        setupTabBarItem()
        setupNavigation()
    }
    
    // MARK: - Public methods
    
    func showNext(screen: Screen) {
        navigationController.pushViewController(getScreen(screen), animated: true)
    }
    
    // MARK: - Private methods
    
    private func setupTabBarItem() {
        let item = UITabBarItem(
            title: title,
            image: UIImage(systemName: "play.square.stack"),
            selectedImage: UIImage(systemName: "play.square.stack.fill"))
        navigationController.tabBarItem = item
    }
    
    private func setupNavigation() {
        navigationController.viewControllers = [getScreen(.popularContentList)]
        navigationController.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController.navigationBar.titleTextAttributes = textAttributes
        navigationController.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController.navigationBar.barStyle = .default
        navigationController.navigationBar.tintColor = .black
    }
    
    private func getScreen(_ screen: Screen) -> UIViewController {
        switch screen {
        case .popularContentList:
            let viewModel = PopularContentListViewModel(delegate: self)
            let controller = PopularContentListViewController(viewModel: viewModel)
            return controller
        case .contentDetail(let content):
            let viewModel = ContentDetailViewModel(contentId: content.id, delegate: self)
            let controller = ContentDetailViewController(viewModel: viewModel)
            return controller
        }
    }
}
