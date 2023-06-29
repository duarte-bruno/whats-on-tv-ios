//
//  ContentSearchViewController.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotCore
import WotView

class ContentSearchViewController: WotViewController {

    // MARK: - Private properties
    
    private var viewModel: ContentSearchViewModelProtocol
    private var contentListView: WotContentListView?
    
    private lazy var searchBarController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = StrContentSearch.TypeYourSearch.l
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    // MARK: - init
    
    init(viewModel: ContentSearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.contentListView = WotContentListView(delegate: self)
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
        viewModel.reaction = self
        setupContentListView()
        setupSearchBar()
    }
    
    private func setupContentListView() {
        guard let contentListView else { return }
        view.addSubview(contentListView)
        
        NSLayoutConstraint.activate([
            contentListView.leftAnchor.constraint(equalTo: view.leftAnchor),
            contentListView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentListView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            contentListView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupSearchBar() {
        searchBarController.searchResultsUpdater = self
        navigationItem.searchController = searchBarController
    }
}

// MARK: - WotViewModelReaction

extension ContentSearchViewController: WotViewModelReaction {
    
    func updateViewState(_ viewState: WotViewState) {
        switch viewState {
        case .showAlert(title: let title, message: let message):
            super.showAlert(title: title, message: message)
        case .updateContent:
            contentListView?.updateContentList(contents: viewModel.searchContentList, replaceOldContent: true)
        default:
            return
        }
    }
}

// MARK: - ContentListViewDelegate

extension ContentSearchViewController: WotContentListViewDelegate {
    
    func contentSelected(_ content: Content) {
        // TODO: Show content detail
    }
}

// MARK: - UISearchResultsUpdating

extension ContentSearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }
        viewModel.searchContent(query)
    }
}
