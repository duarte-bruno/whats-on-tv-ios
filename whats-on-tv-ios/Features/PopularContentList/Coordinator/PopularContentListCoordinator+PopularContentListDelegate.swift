//
//  PopularContentListCoordinator+PopularContentListDelegate.swift
//  whats-on-tv-ios
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation

extension PopularContentListCoordinator: PopularContentListDelegate {
    
    func getContentList() {
        let service = PopularContentListService(httpRequest)
        service.getPopularContent { result in
            switch result {
            case .success(let contentList):
                print(contentList.count)
            case .failure(let error):
                print(error.description)
            }
        }
    }
}
