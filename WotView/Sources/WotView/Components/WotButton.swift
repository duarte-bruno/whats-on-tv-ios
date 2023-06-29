//
//  WotButton.swift
//  
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotCore

public enum WotButtonType {
    case primary
    case secondary
    
    var color: WotColor {
        switch self {
        case .primary:
            return WotTheme.shared.color.primary
        case .secondary:
            return WotTheme.shared.color.secondary
        }
    }
}

public class WotButton: UIButton {

    // MARK: - init
    
    public init(_ type: WotButtonType = .primary) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.setTitleColor(type.color.tint, for: .normal)
        self.layer.borderWidth = 2
        self.layer.borderColor = type.color.tint.cgColor
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        self.layer.cornerRadius = 4
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError(StrError.InitCoderNotImplemented.l)
    }
}
