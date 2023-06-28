//
//  ContentListCollectionViewCell.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import UIKit
import WotView

class WotContentListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Public properties
    
    static let cellIdentifier = "WotContentListCollectionViewCell"
    
    // MARK: - Private properties
    
    private let label = UILabel()
    private let image = WotImageView()
    private var content: Content?

    // MARK: - Public methods

    func setupCell(with content: Content) {
        self.content = content
        setupLabel()
        setupImage()
    }
    
    // MARK: - Private methods
    
    private func setupLabel() {
        guard let content = content else { return }
        
        label.text = content.name
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupImage() {
        guard let content = content else { return }
        
        image.loadImageUsing(content.image?.medium ?? "")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            image.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -6),
            image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 1.0/0.67)
        ])
    }
}
