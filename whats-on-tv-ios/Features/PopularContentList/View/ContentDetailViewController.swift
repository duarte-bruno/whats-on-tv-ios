//
//  ContentDetailViewController.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotCore
import WotView

class ContentDetailViewController: WotViewController {

    // MARK: - Private properties
    
    private var viewModel: ContentDetailViewModelProtocol
    
    // MARK: - init
    
    init(viewModel: ContentDetailViewModelProtocol) {
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getContentDetail()
    }
    
    // MARK: - Private methods
    
    private func setup() {
        title = viewModel.title
        viewModel.reaction = self
    }
}

// MARK: - WotViewModelReaction

extension ContentDetailViewController: WotViewModelReaction {
    
    func updateViewState(_ viewState: WotViewState) {
        switch viewState {
        case .showAlert(title: let title, message: let message):
            super.showAlert(title: title, message: message)
        case .updateContent:
            // Update screen content
            return
        default:
            return
        }
    }
}
