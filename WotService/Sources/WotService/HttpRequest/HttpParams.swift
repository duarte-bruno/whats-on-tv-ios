//
//  HttpParams.swift
//  
//
//  Created by Bruno Duarte on 27/06/23.
//

import Foundation

public struct HttpParams {
    
    /// URL path after the base URL (this path should not start with "/")
    let path: String
    /// Query string params
    let queryParams: [String: String]?
}
