//
//  PopularContentListViewController.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import UIKit
import WotCore

class PopularContentListViewController: UIViewController {

    // MARK: - Private properties
    
    private var viewModel: PopularContentListViewModelProtocol
    
    // MARK: - init
    
    init(viewModel: PopularContentListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(StrError.InitCoderNotImplemented.l)
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        title = viewModel.title
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getContentList()
    }
}
