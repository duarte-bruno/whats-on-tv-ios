//
//  ContentDetailViewModel.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation
import WotView
import WotCore

protocol ContentDetailDelegate: AnyObject {
    
    /// Called when it's view did load and the content detail should be presented.
    /// - Parameter sender: ViewModel which made this callback
    /// - Parameter pageIndex: Current page index
    func getContentDetail(id: Int, sender: ContentDetailViewModelProtocol)
}

protocol ContentDetailViewModelProtocol: WotViewModelProtocol {
    
    /// A list of content to be displayed
    var contentDetail: ContentDetail? { get }
    
    init(contentId: Int, delegate: ContentDetailDelegate?)

    /// Update the content displayed on screen
    /// - Parameter contentList: New content list
    func updateContentDetail(_ contentDetail: ContentDetail)
    
    /// Called when it's view did load and the content detail should be presented.
    func getContentDetail()
}

class ContentDetailViewModel: ContentDetailViewModelProtocol {
    
    // MARK: - Private properties
    
    private weak var delegate: ContentDetailDelegate?
    private let contentId: Int
    
    // MARK: - Public properties
    
    var title: String
    private(set) var contentDetail: ContentDetail? {
        didSet {
            self.reaction?.updateViewState(.updateContent)
        }
    }
    var reaction: WotViewModelReaction?
    
    // MARK: - Init
    
    required init(contentId: Int, delegate: ContentDetailDelegate?) {
        self.contentId = contentId
        self.delegate = delegate
        self.title = StrContentDetail.Title.l
    }
    
    // MARK: - Public methods
    
    func updateContentDetail(_ contentDetail: ContentDetail) {
        guard
            let seasons = contentDetail._embedded?.seasons,
            let episodes = contentDetail._embedded?.episodes
        else { return }
        
        var newSeasonList: [Season] = []
        for var season in seasons {
            season.episodes = episodes.filter({
                $0.season == season.number
            })
            newSeasonList.append(season)
        }
        
        var content = contentDetail
        content.seasons = newSeasonList
        content._embedded = nil
        
        self.contentDetail = content
    }
    
    func updateViewState(_ viewState: WotViewState) {
        self.reaction?.updateViewState(viewState)
    }
    
    func getContentDetail() {
        self.delegate?.getContentDetail(id: contentId, sender: self)
    }
}
