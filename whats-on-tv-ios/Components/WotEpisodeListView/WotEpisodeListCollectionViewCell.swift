//
//  WotEpisodeListCollectionViewCell.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotView

class WotEpisodeListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Public properties
    
    static let cellIdentifier = "WotEpisodeListCollectionViewCell"
    
    // MARK: - Private properties
    
    private let label = UILabel()
    private let image = WotImageView()
    private var episode: Episode?

    // MARK: - Public methods

    func setupCell(with episode: Episode) {
        self.episode = episode
        contentView.backgroundColor = .clear
        setupImage()
        setupLabel()
    }
    
    // MARK: - Private methods
    
    private func setupImage() {
        guard let episode = episode else { return }
        
        image.loadImageUsing(episode.image?.medium ?? "")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.isUserInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4),
            image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 0.6)
        ])
    }
    
    private func setupLabel() {
        guard let episode = episode else { return }
        
        label.text = "\(episode.number). \(episode.name)"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = WotTheme.shared.color.light.tint
        label.textAlignment = .left
        label.numberOfLines = 0
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 10),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
