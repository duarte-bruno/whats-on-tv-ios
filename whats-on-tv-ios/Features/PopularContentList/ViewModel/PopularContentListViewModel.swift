//
//  PopularContentListViewModel.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation

protocol PopularContentListDelegate: AnyObject {
    
    /// Called when it's view did load and the content list should be updated.
    func getContentList()
}

protocol PopularContentListViewModelProtocol {
    
    var title: String { get }
    
    init(delegate: PopularContentListDelegate?)
    
    /// Called when it's view did load and the content list should be updated.
    func getContentList()
}

class PopularContentListViewModel: PopularContentListViewModelProtocol {
    
    // MARK: - Private properties
    
    private weak var delegate: PopularContentListDelegate?
    
    // MARK: - Public properties
    
    let title: String
    
    // MARK: - Init
    
    required init(delegate: PopularContentListDelegate? = nil) {
        self.delegate = delegate
        self.title = StrPopularContentList.Title.l
    }
    
    // MARK: - Public methods
    
    func getContentList() {
        delegate?.getContentList()
    }
}
