//
//  PopularContentListViewModel.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation

protocol PopularContentListViewModelProtocol {
    
    var title: String { get }
}

class PopularContentListViewModel: PopularContentListViewModelProtocol {
    
    // MARK: - Public properties
    
    let title: String
    
    // MARK: - Init
    
    init() {
        self.title = StrPopularContentList.Title.l
    }
}
