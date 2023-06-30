//
//  WotEpisodeListHeaderReusableView.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotView

class WotEpisodeListHeaderReusableView: UICollectionReusableView {
    
    // MARK: - Public properties
    
    static let viewIdentifier = "WotEpisodeListHeaderReusableView"
    
    // MARK: - Private properties
    
    private let titleLabel = WotTitleLabel()
    private var title: String = ""
    
    // MARK: - Public methods
    
    func setupView(with title: String) {
        self.title = title
        self.backgroundColor = .clear
        setupLabel()
    }
    
    // MARK: - Private methods
    
    private func setupLabel() {
        titleLabel.text = title
        titleLabel.textColor = WotTheme.shared.color.light.tint
        titleLabel.layer.shadowColor = WotTheme.shared.color.dark.tint.cgColor
        titleLabel.layer.shadowRadius = 3.0
        titleLabel.layer.shadowOpacity = 1.0
        titleLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        titleLabel.layer.masksToBounds = false
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        ])
    }
}
