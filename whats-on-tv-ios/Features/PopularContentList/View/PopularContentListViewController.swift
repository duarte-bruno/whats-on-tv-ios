//
//  PopularContentListViewController.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import UIKit
import WotCore
import WotView

class PopularContentListViewController: WotViewController {

    // MARK: - Private properties
    
    private var viewModel: PopularContentListViewModelProtocol
    private var contentListView: WotContentListView?
    
    // MARK: - init
    
    init(viewModel: PopularContentListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.contentListView = WotContentListView(delegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError(StrError.InitCoderNotImplemented.l)
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        title = viewModel.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getContentList()
    }
    
    // MARK: - Private methods
    
    private func setup() {
        viewModel.reaction = self
        setupContentListView()
    }
    
    private func setupContentListView() {
        guard let contentListView else { return }
        view.addSubview(contentListView)
        
        NSLayoutConstraint.activate([
            contentListView.leftAnchor.constraint(equalTo: view.leftAnchor),
            contentListView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentListView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            contentListView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
    }
}

// MARK: - WotViewModelReaction

extension PopularContentListViewController: WotViewModelReaction {
    
    func updateViewState(_ viewState: WotViewState) {
        switch viewState {
        case .showAlert(title: let title, message: let message):
            super.showAlert(title: title, message: message)
        case .updateContent:
            contentListView?.updateContentList(contents: viewModel.contentList)
        default:
            return
        }
    }
}

// MARK: - ContentListViewDelegate

extension PopularContentListViewController: WotContentListViewDelegate {
    
    func contentSelected(content: Content) {
        // TODO: Show content detail
    }
}
