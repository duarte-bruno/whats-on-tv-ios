//
//  EpisodesListViewModel.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation
import WotView
import WotCore

protocol EpisodesListDelegate: AnyObject {
    
    /// Called when an item is selected
    /// - Parameter episode: Episode to show detail
    func showEpisodeDetail(episode: Episode)
}

protocol EpisodesListViewModelProtocol: WotViewModelProtocol {
    
    /// Content to be displayed
    var contentDetail: ContentDetail { get }
    
    init(contentDetail: ContentDetail, delegate: EpisodesListDelegate?)
    
    /// Called when an item is selected
    /// - Parameter episode: Episode to show detail
    func showEpisodeDetail(episode: Episode)
}

class EpisodesListViewModel: EpisodesListViewModelProtocol {
    
    // MARK: - Private properties
    
    private weak var delegate: EpisodesListDelegate?
    
    // MARK: - Public properties
    
    let title: String
    let contentDetail: ContentDetail
    var reaction: WotViewModelReaction?
    
    required init(contentDetail: ContentDetail, delegate: EpisodesListDelegate?) {
        self.delegate = delegate
        self.title = StrEpisodesList.Title.l
        self.contentDetail = contentDetail
    }
    
    // MARK: - Public methods
    
    func showEpisodeDetail(episode: Episode) {
        self.delegate?.showEpisodeDetail(episode: episode)
    }

    func updateViewState(_ viewState: WotViewState) {
        self.reaction?.updateViewState(viewState)
    }
}
