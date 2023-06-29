//
//  ContentSearchViewModel.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation
import WotView
import WotCore

protocol ContentSearchViewModelDelegate: AnyObject {
    
    /// Called when search action is released
    /// - Parameter sender: ViewModel which made this callback
    /// - Parameter search: Search term
    func searchContent(_ search: String, sender: ContentSearchViewModelProtocol)
}

protocol ContentSearchViewModelProtocol: WotViewModelProtocol {
    
    /// A list of content to be displayed
    var searchContentList: [Content] { get }
    
    init(delegate: ContentSearchViewModelDelegate?)
    
    /// Called when search action is released
    /// - Parameter search: Search term
    func searchContent(_ search: String)
    
    /// Update the contenti list displayed on screen
    /// - Parameter searchContentList: A list of content to be displayed
    func updateSearchContentList(_ searchContentList: [ContentSearch])
}

class ContentSearchViewModel: ContentSearchViewModelProtocol {
    
    // MARK: - Private properties
    
    private weak var delegate: ContentSearchViewModelDelegate?
    
    // MARK: - Public properties
    
    var title: String
    private(set) var searchContentList: [Content] {
        didSet {
            self.reaction?.updateViewState(.updateContent)
        }
    }
    var reaction: WotViewModelReaction?
    
    // MARK: - Init
    
    required init(delegate: ContentSearchViewModelDelegate?) {
        self.delegate = delegate
        self.title = StrContentSearch.Title.l
        self.searchContentList = []
    }
    
    // MARK: - Public methods
    
    func searchContent(_ search: String) {
        delegate?.searchContent(search, sender: self)
    }
    
    func updateSearchContentList(_ searchContentList: [ContentSearch]) {
        var contentList: [Content] = []
        for contentSearch in searchContentList {
            contentList.append(contentSearch.show)
        }
        
        self.searchContentList = contentList
    }
    
    func updateViewState(_ viewState: WotViewState) {
        self.reaction?.updateViewState(viewState)
    }
}
