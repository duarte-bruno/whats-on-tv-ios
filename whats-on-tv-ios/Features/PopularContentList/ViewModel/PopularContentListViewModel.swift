//
//  PopularContentListViewModel.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation
import WotView
import WotCore

protocol PopularContentListDelegate: AnyObject {
    
    /// Called when it's view did load and the content list should be updated.
    /// - Parameter sender: ViewModel which made this callback
    func getContentList(sender: PopularContentListViewModelProtocol)
}

protocol PopularContentListViewModelProtocol: WotViewModelProtocol {
    
    /// A list os content to be displayed
    var contentList: [Content] { get }
    
    init(delegate: PopularContentListDelegate?)
    
    /// Called when it's view did load and the content list should be updated.
    func getContentList()
    
    /// Update the contenti list displayed on screen
    /// - Parameter contentList: New content list
    func updateContentList(_ contentList: [Content])
}

class PopularContentListViewModel: PopularContentListViewModelProtocol {
    
    // MARK: - Private properties
    
    private weak var delegate: PopularContentListDelegate?
    
    // MARK: - Public properties
    
    let title: String
    private(set) var contentList: [Content] {
        didSet {
            self.reaction?.updateViewState(.updateContent)
        }
    }
    var reaction: WotViewModelReaction?
    
    // MARK: - Init
    
    required init(delegate: PopularContentListDelegate? = nil) {
        self.delegate = delegate
        self.title = StrPopularContentList.Title.l
        self.contentList = []
    }
    
    // MARK: - Public methods
    
    func getContentList() {
        delegate?.getContentList(sender: self)
    }
    
    func updateContentList(_ contentList: [Content]) {
        self.contentList = contentList
    }
    
    func updateViewState(_ viewState: WotViewState) {
        self.reaction?.updateViewState(viewState)
    }
}
