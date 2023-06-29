//
//  WotContentListView.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import UIKit
import WotCore

protocol WotContentListViewDelegate: AnyObject {
    func contentSelected(_ content: Content)
    func addMoreData(_ currentIndex: Int)
}

class WotContentListView: UIView {

    // MARK: - Public properties
    
    private(set) var currentIndex: Int
    
    // MARK: - Private properties
    
    private let collectionView: UICollectionView
    private weak var delegate: WotContentListViewDelegate?
    private var contents: [Content]
    
    // MARK: - Init
    
    init(delegate: WotContentListViewDelegate?) {
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.delegate = delegate
        self.contents = []
        self.currentIndex = 0
        super.init(frame: .zero)
        
        setupView()
        setupCollectionView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(StrError.InitCoderNotImplemented.l)
    }
    
    // MARK: - Public methods
    
    func updateContentList(contents: [Content]) {
        DispatchQueue.main.async { [weak self] in
            self?.contents.append(contentsOf: contents)
            self?.currentIndex += 1
            self?.collectionView.reloadData()
        }
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        backgroundColor = .clear
        collectionView.backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupCollectionView() {
        collectionView.register(WotContentListCollectionViewCell.self, forCellWithReuseIdentifier: WotContentListCollectionViewCell.cellIdentifier)
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        
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
        let itemWidth = (UIScreen.main.bounds.width / 2) - (16 + 6)

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 10
        
        layout.itemSize = CGSize(width: itemWidth, height: (itemWidth * (1.0/0.67)) + 6 + 40)
        
        return layout
    }
}

// MARK: - UICollectionViewDataSource

extension WotContentListView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WotContentListCollectionViewCell.cellIdentifier, for: indexPath) as? WotContentListCollectionViewCell else {
            return UICollectionViewCell(frame: .zero)
        }
        
        cell.setupCell(with: contents[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.contentSelected(contents[indexPath.row])
    }
}

extension WotContentListView: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let indexToReload = contents.count - 20 > 0 ? contents.count - 20 : 0
        let indexPath = IndexPath(item: indexToReload, section: indexPaths[0].section)
        if indexPaths.firstIndex(of: indexPath) != nil {
            delegate?.addMoreData(currentIndex)
        }
    }
}
