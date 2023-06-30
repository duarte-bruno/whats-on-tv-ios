//
//  EpisodeDetailViewModel.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation
import WotView
import WotCore

protocol EpisodeDetailViewModelProtocol: WotViewModelProtocol {
    
    /// Content to be displayed
    var episode: Episode { get }
    
    init(episode: Episode)
}

class EpisodeDetailViewModel: EpisodeDetailViewModelProtocol {

    // MARK: - Public properties
    
    var episode: Episode
    var title: String
    var reaction: WotViewModelReaction?
    
    // MARK: - Init
    
    required init(episode: Episode) {
        self.episode = episode
        self.title = StrContentDetail.Title.l
    }
    
    // MARK: - Public methods
    
    func updateViewState(_ viewState: WotViewState) {
        self.reaction?.updateViewState(viewState)
    }
    
}
