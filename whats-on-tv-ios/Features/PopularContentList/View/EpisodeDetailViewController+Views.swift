//
//  EpisodeDetailViewController+Views.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotView
import WotCore

extension EpisodeDetailViewController {
    
    // MARK: - Public methods
    
    func setupDatailsContent() {
        setupContentView()
        setupCover()
        setupLabels()
        setupEmptySpace()
    }
    
    // MARK: - Private methods
    
    private func setupContentView() {
        self.view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    private func setupCover() {
        guard let imageUrl = viewModel.episode.image?.original else { return }
        
        let cover = WotImageView()
        cover.loadImageUsing(imageUrl)
        
        cover.contentMode = .scaleAspectFill
        cover.clipsToBounds = true
        cover.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.contentStackView.addArrangedSubview(cover)
        contentView.contentStackView.setCustomSpacing(25, after: cover)
        
        NSLayoutConstraint.activate([
            cover.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cover.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cover.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6)
        ])
    }
    
    private func setupLabels() {
        let nameLabel = WotTitleLabel(text: "\(viewModel.episode.number). \(viewModel.episode.name)")
        nameLabel.padding(0, 0, 16, 16)
        contentView.contentStackView.addArrangedSubview(nameLabel)
        
        let seasonLabel = WotTitleLabel(text: "\(StrEpisodesList.Season.l) \(viewModel.episode.season)")
        seasonLabel.textColor = WotTheme.shared.color.primary.tint
        seasonLabel.padding(0, 0, 16, 16)
        contentView.contentStackView.addArrangedSubview(seasonLabel)
        contentView.contentStackView.setCustomSpacing(25, after: seasonLabel)
        
        if let summary = viewModel.episode.summary {
            let label = WotLabel(text: summary.htmlSanitized())
            label.padding(0, 0, 16, 16)
            contentView.contentStackView.addArrangedSubview(label)
        }
    }
    
    private func setupEmptySpace() {
        let spaceView = UIView()
        spaceView.backgroundColor = .clear
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.contentStackView.addArrangedSubview(spaceView)
        
        NSLayoutConstraint.activate([
            spaceView.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
