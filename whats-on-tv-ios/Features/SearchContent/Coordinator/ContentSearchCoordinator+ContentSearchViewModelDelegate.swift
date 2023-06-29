//
//  ContentSearchCoordinator+ContentSearchViewModelDelegate.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation
import WotCore

extension ContentSearchCoordinator: ContentSearchViewModelDelegate {
    
    func searchContent(_ search: String, sender: ContentSearchViewModelProtocol) {
        let service = ContentService(httpRequest)
        service.searchContent(search: search) { result in
            switch result {
            case .success(let searchContentList):
                sender.updateSearchContentList(searchContentList)
            case .failure(let error):
                sender.updateViewState(.showAlert(title: StrGeneric.Ops.l, message: error.description))
            }
        }
    }
    
    func showContentDetail(content: Content) {
        showNext(screen: .contentDetail(content))
    }
}
