//
//  FetchError.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 6.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

public enum FetchError: Error, Equatable {
    case network, url, parseObject, parseJSON, general, encode
    case createJSON
    case other(description: String)
    
    public var description: String {
        switch self {
        case .network:
            return "Network Error"
        case .parseObject:
            return "Parse Object Error"
        case .parseJSON:
            return "Parse JSON Error"
        case .url:
            return "Url Error"
        case .createJSON:
            return "Create JSON Error"
        case .other(let description):
            return description
        default:
            return "Error"
        }
    }
    
    public static func ==(left: FetchError, right: FetchError) -> Bool {
        switch (left, right) {
        case (.network, .network),
             (.parseJSON, .parseJSON),
             (.parseObject, .parseObject),
             (.createJSON, .createJSON),
             (.encode, .encode),
             (.url, .url):
            return true
            
        case (.other(let leftDescription), .other(let rightDescription)):
            return leftDescription == rightDescription
            
        default:
            return false
        }
    }
}
