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
    
    // MARK: - init
    
    init(viewModel: EpisodesListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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
        title = viewModel.title
    }
}
