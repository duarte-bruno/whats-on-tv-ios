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
    /// - Parameter pageIndex: Current page index
    func updateContentList(pageIndex: Int, sender: PopularContentListViewModelProtocol)
}

protocol PopularContentListViewModelProtocol: WotViewModelProtocol {
    
    /// A list of content to be displayed
    var currentContentList: [Content] { get }
    
    init(delegate: PopularContentListDelegate?)
    
    /// Called when it's view did load and the content list should be updated.
    /// - Parameter pageIndex: Current page index
    func updateContentList(_ pageIndex: Int)
    
    /// Update the contenti list displayed on screen
    /// - Parameter contentList: New content list
    func updateContentList(_ contentList: [Content])
}

class PopularContentListViewModel: PopularContentListViewModelProtocol {
    
    // MARK: - Private properties
    
    private weak var delegate: PopularContentListDelegate?
    
    // MARK: - Public properties
    
    let title: String
    private(set) var currentContentList: [Content] {
        didSet {
            self.reaction?.updateViewState(.updateContent)
        }
    }
    var reaction: WotViewModelReaction?
    
    // MARK: - Init
    
    required init(delegate: PopularContentListDelegate? = nil) {
        self.delegate = delegate
        self.title = StrPopularContentList.Title.l
        self.currentContentList = []
    }
    
    // MARK: - Public methods
    
    func updateContentList(_ pageIndex: Int) {
        delegate?.updateContentList(pageIndex: pageIndex, sender: self)
    }
    
    func updateContentList(_ contentList: [Content]) {
        self.currentContentList = contentList
    }
    
    func updateViewState(_ viewState: WotViewState) {
        self.reaction?.updateViewState(viewState)
    }
}
