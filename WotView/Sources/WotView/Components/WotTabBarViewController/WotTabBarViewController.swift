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
        fatalError(StrError.InitCoderNotImplemented.l)
    }
    
    // MARK: - Private methods
    
    private func setup() {
        self.viewControllers = createControlerList()
        self.selectedViewController = getSelectedController()
        self.selectedIndex = initialSelectedIndex
        self.tabBar.barStyle = .default
        self.tabBar.tintColor = WotTheme.shared.color.primary.tint
        self.tabBar.unselectedItemTintColor = WotTheme.shared.color.secondary.tint
        self.tabBar.isTranslucent = true
        self.tabBar.barTintColor = .clear
        self.tabBar.layer.borderColor = UIColor.clear.cgColor
        
        let image = UIImage.imageWithColor(color: .clear) //WotTheme.shared.color.dark.tint.withAlphaComponent(0.95))
        
        self.tabBar.backgroundImage = image
        self.tabBar.shadowImage = image
        self.tabBar.itemPositioning = .centered
        addTopMargin()
    }
    
    private func addTopMargin() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = WotTheme.shared.color.dark.tint.withAlphaComponent(0.95)
        
        self.tabBar.addSubview(view)
        self.tabBar.sendSubviewToBack(view)
        
        NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: self.tabBar.leftAnchor),
            view.rightAnchor.constraint(equalTo: self.tabBar.rightAnchor),
            view.bottomAnchor.constraint(equalTo: self.tabBar.bottomAnchor),
            view.topAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: -5),
        ])
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
