//
//  AppDelegate.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 26/06/23.
//

import UIKit
import WotService

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - AppDelegate Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        serviceConfiguration()
        return true
    }

    // MARK: - UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

// MARK: - Configuration

extension AppDelegate {
    
    private func serviceConfiguration() {
        WotService.shared.configure(
            baseUrl: "https://api.tvmaze.com/",
            bundle: Bundle.main
        )
    }
}

