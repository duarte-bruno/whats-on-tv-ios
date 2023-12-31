//
//  ContentDetailViewController+Views.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotView
import WotCore

extension ContentDetailViewController {
    
    // MARK: - Public methods
    
    func setupDatailsContent() {
        setupContentView()
        setupCover()
        setupLabels()
        setupEpisodesButton()
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
        guard let imageUrl = viewModel.contentDetail?.image?.original else { return }
        
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
            cover.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.5)
        ])
    }
    
    private func setupLabels() {
        if let name = viewModel.contentDetail?.name {
            let label = WotTitleLabel(text: name)
            label.padding(0, 0, 16, 16)
            contentView.contentStackView.addArrangedSubview(label)
        }
        
        if let genres = viewModel.contentDetail?.genres {
            let label = WotBoldLabel(text: genres.joined(separator:" . "))
            label.textColor = WotTheme.shared.color.primary.tint
            label.padding(0, 0, 16, 16)
            contentView.contentStackView.addArrangedSubview(label)
        }
        
        if let schedule = viewModel.contentDetail?.schedule, let time = viewModel.contentDetail?.averageRuntime {
            let text =
                "\(StrContentDetail.Schedule.l): " +
                schedule.days.joined(separator:", ") +
                " at \(schedule.time) (\(time))"
            let label = WotLabel(text: text)
            label.padding(0, 0, 16, 16)
            contentView.contentStackView.addArrangedSubview(label)
            contentView.contentStackView.setCustomSpacing(25, after: label)
        }
        
        if let summary = viewModel.contentDetail?.summary {
            let label = WotLabel(text: summary.htmlSanitized())
            label.padding(0, 0, 16, 16)
            contentView.contentStackView.addArrangedSubview(label)
            contentView.contentStackView.setCustomSpacing(25, after: label)
        }
    }
    
    private func setupEpisodesButton() {
        guard let seasons = viewModel.contentDetail?.seasons, !seasons.isEmpty else { return }
        
        let button = WotButton(.primary)
        button.setTitle(StrContentDetail.SeeEpisodesList.l, for: .normal)
        button.addTarget(self, action: #selector(seeEpisodesList), for: .touchUpInside)
        
        let container = UIView()
        container.backgroundColor = .clear
        container.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: container.topAnchor),
            button.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
        
        contentView.contentStackView.addArrangedSubview(container)
    }
    
    @objc private func seeEpisodesList() {
        viewModel.seeEpisodesList()
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
