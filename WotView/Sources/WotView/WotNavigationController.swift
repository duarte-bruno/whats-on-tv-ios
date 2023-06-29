//
//  WotNavigationController.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import UIKit

public class WotNavigationController: UINavigationController {

    // MARK: - Init
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            setup()
        }
    }
    
    // MARK: - Private methods
    
    @available(iOS 13.0, *)
    private func setup() {
        self.navigationBar.barStyle = .default
        self.navigationBar.isTranslucent = false
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.tintColor = WotTheme.shared.color.light.tint
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = WotTheme.shared.color.tertiary.tint
        appearance.titleTextAttributes = [.foregroundColor: WotTheme.shared.color.light.tint]
        appearance.shadowImage = nil
        appearance.shadowColor = .none
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
    }
}
