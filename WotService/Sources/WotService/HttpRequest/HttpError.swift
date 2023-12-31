//
//  HttpError.swift
//  
//
//  Created by Bruno Duarte on 27/06/23.
//

import Foundation

public enum HttpError: Error, CustomStringConvertible {
    case invalidPath
    case transportError(Error?)
    case serverSideError(Int)
    case unexpected
    case serialization
    
    public var description: String {
        switch self {
        case .invalidPath:
            return "The requested path is not valid."
        case .transportError(let error):
            return "Some errors occurred while trying to request the server. Description: (\(error?.localizedDescription ?? ""))."
        case .serverSideError(let code):
            return "The request failed with the status code \(code)."
        case .unexpected:
            return "Some unexpected error ocurred."
        case .serialization:
            return "Cannot serialize response into requested object."
        }
    }
}
