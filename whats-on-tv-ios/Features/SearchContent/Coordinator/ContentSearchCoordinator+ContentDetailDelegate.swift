//
//  ContentSearchCoordinator+ContentDetailDelegate.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 29/06/23.
//

import Foundation
import WotCore

extension ContentSearchCoordinator: ContentDetailDelegate {
    
    func getContentDetail(id: Int, sender: ContentDetailViewModelProtocol) {
        let service = ContentService(httpRequest)
        service.getContentDetails(id: id) { result in
            switch result {
            case .success(let contentDetail):
                sender.updateContentDetail(contentDetail)
            case .failure(let error):
                sender.updateViewState(.showAlert(title: StrGeneric.Ops.l, message: error.description))
            }
        }
    }
    
    func seeEpisodesList(contentDetail: ContentDetail) {
        // TODO: Show episodes
    }
}
