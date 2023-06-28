//
//  WotViewController.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import UIKit
import WotCore

open class WotViewController: UIViewController {

    public func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: StrGeneric.Ok.l, style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
