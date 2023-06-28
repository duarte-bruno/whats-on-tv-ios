//
//  PopularContentListViewController.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import UIKit

class PopularContentListViewController: UIViewController {

    // MARK: - Private properties
    
    private var viewModel: PopularContentListViewModelProtocol
    
    // MARK: - init
    
    init(viewModel: PopularContentListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        title = viewModel.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
