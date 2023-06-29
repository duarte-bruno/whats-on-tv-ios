//
//  WotViewController.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import UIKit
import WotCore

open class WotViewController: UIViewController {

    open override func loadView() {
        view = UIView()
        view.backgroundColor = WotTheme.shared.color.tertiary.tint
    }
    
    // MARK: - Public methods
    
    public func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: StrGeneric.Ok.l, style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
