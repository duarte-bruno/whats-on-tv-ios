//
//  WotEpisodeListView.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotCore

protocol WotEpisodeListViewDelegate: AnyObject {
    func episodeSelected(_ episode: Episode)
}

class WotEpisodeListView: UIView {
    
    // MARK: - Private properties
    
    private let collectionView: UICollectionView
    private weak var delegate: WotEpisodeListViewDelegate?
    private var seasons: [Season]
    
    // MARK: - Init
    
    init(seasons: [Season], delegate: WotEpisodeListViewDelegate?) {
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.delegate = delegate
        self.seasons = seasons
        super.init(frame: .zero)
        
        setupView()
        setupCollectionView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(StrError.InitCoderNotImplemented.l)
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        backgroundColor = .clear
        collectionView.backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupCollectionView() {
        collectionView.register(WotEpisodeListCollectionViewCell.self, forCellWithReuseIdentifier: WotEpisodeListCollectionViewCell.cellIdentifier)
        collectionView.register(WotEpisodeListHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WotEpisodeListHeaderReusableView.viewIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.collectionViewLayout = createCollectionLayout()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    private func createCollectionLayout() -> UICollectionViewLayout {
        let itemWidth = UIScreen.main.bounds.width - 32

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        layout.sectionHeadersPinToVisibleBounds = true
        
        layout.itemSize = CGSize(width: itemWidth, height: (itemWidth * 0.4) * 0.6)
        layout.headerReferenceSize = CGSize(width: itemWidth, height: 40)
        
        return layout
    }
}

// MARK: - UICollectionViewDelegate

extension WotEpisodeListView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let episode = seasons[indexPath.section].episodes?[indexPath.row] {
            delegate?.episodeSelected(episode)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension WotEpisodeListView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return seasons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasons[section].episodes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WotEpisodeListCollectionViewCell.cellIdentifier, for: indexPath) as? WotEpisodeListCollectionViewCell,
            let episode = seasons[indexPath.section].episodes?[indexPath.row] else {
            return UICollectionViewCell(frame: .zero)
        }
        
        cell.setupCell(with: episode)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            if let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: WotEpisodeListHeaderReusableView.viewIdentifier,
                for: indexPath) as? WotEpisodeListHeaderReusableView {
                
                header.setupView(with: "\(StrEpisodesList.Season.l) \(seasons[indexPath.section].number)")
                return header
            }
        }
        
        return UICollectionReusableView(frame: .zero)
    }
}
