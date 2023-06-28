//
//  PopularContentListCoordinator+PopularContentListDelegate.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation
import WotCore

extension PopularContentListCoordinator: PopularContentListDelegate {
    
    func getContentList(sender: PopularContentListViewModelProtocol) {
        let service = PopularContentListService(httpRequest)
        service.getPopularContent { result in
            switch result {
            case .success(let contentList):
                sender.updateContentList(contentList)
            case .failure(let error):
                sender.updateViewState(.showAlert(title: StrGeneric.Ops.l, message: error.description))
            }
        }
    }
}
