//
//  EpisodeDetailViewController.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotCore
import WotView

class EpisodeDetailViewController: WotViewController {

    // MARK: - Public properties
    
    var viewModel: EpisodeDetailViewModelProtocol
    let contentView: WotGenericScrollContentView
    
    // MARK: - init
    
    init(viewModel: EpisodeDetailViewModelProtocol) {
        self.viewModel = viewModel
        self.contentView = WotGenericScrollContentView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(StrError.InitCoderNotImplemented.l)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupDatailsContent()
    }
    
    // MARK: - Private methods
    
    private func setup() {
        title = viewModel.title
    }
}
