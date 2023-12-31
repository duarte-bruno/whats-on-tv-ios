//
//  SceneDelegate.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 26/06/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let mainCoordinator = MainCoordinator()
        window.rootViewController = mainCoordinator.initialController
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

