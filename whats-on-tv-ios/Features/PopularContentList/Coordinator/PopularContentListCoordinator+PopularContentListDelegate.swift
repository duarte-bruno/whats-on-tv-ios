//
//  PopularContentListCoordinator+PopularContentListDelegate.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation
import WotCore

extension PopularContentListCoordinator: PopularContentListDelegate {
    
    func updateContentList(pageIndex: Int, sender: PopularContentListViewModelProtocol) {
        let service = ContentService(httpRequest)
        service.getPopularContent(pageIndex: pageIndex, completion: { result in
            switch result {
            case .success(let contentList):
                sender.updateContentList(contentList)
            case .failure(let error):
                sender.updateViewState(.showAlert(title: StrGeneric.Ops.l, message: error.description))
            }
        })
    }
    
    func showContentDetail(content: Content) {
        showNext(screen: .contentDetail(content))
    }
}
