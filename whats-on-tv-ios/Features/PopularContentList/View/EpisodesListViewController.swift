//
//  EpisodesListViewController.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotCore
import WotView

class EpisodesListViewController: WotViewController {

    // MARK: - Private properties
    
    private var viewModel: EpisodesListViewModelProtocol
    private var episodeListView: WotEpisodeListView?
    
    // MARK: - init
    
    init(viewModel: EpisodesListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.episodeListView = WotEpisodeListView(episodes: viewModel.contentDetail.seasons?[0].episodes ?? [], delegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError(StrError.InitCoderNotImplemented.l)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Private methods
    
    private func setup() {
        title = viewModel.contentDetail.name
        setupEpisodeListView()
    }
    
    private func setupEpisodeListView() {
        guard let episodeListView else { return }
        view.addSubview(episodeListView)
        
        NSLayoutConstraint.activate([
            episodeListView.leftAnchor.constraint(equalTo: view.leftAnchor),
            episodeListView.rightAnchor.constraint(equalTo: view.rightAnchor),
            episodeListView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            episodeListView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension EpisodesListViewController: WotEpisodeListViewDelegate {
    
    func episodeSelected(_ episode: Episode) {
        viewModel.showEpisodeDetail(episode: episode)
    }
}
