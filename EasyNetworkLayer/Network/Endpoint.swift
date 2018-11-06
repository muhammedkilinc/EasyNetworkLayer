//
//  Endpoint.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 6.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

public typealias URLParameter = [String: AnyObject]?

public protocol Endpoint {
    var base: String { get }
    var apiKey: String { get }
    var path: String { get }
    var parameters: URLParameter? { get }
}

public extension Endpoint {
    
    public var base: String {
        return "newsapi.org"
    }
    
    public var apiKey: String {
        return "3073a66586c646cb8ca68c805efdff12"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = base
        
        var slashAddedUrlString = path
        if !path.hasPrefix("/") {
            slashAddedUrlString = "/v2" + "/".appending(path)
        }
        components.path = slashAddedUrlString
        
        if let parameters = parameters as? [String: AnyObject] {
            components.queryItems = parameters.map({ element in
                return URLQueryItem(name: element.key, value: element.value as? String)
            })
        }
        return components
    }
    
    var request: URLRequest? {
        guard let url = urlComponents.url else {
            return nil
        }
        print(url)
        return URLRequest(url: url)
    }
}

public enum NewsFeed {
    case getSources
    case getTopHeadlines(countryId: String)
}

extension NewsFeed: Endpoint {
    
    public var path: String {
        switch self {
        case .getSources:
            return "sources"
        case .getTopHeadlines( _):
            return "top-headlines"
        }
    }
    
    public var parameters: URLParameter? {
        switch self {
        case .getTopHeadlines(let countryId):
            return ["country": countryId as AnyObject, "apiKey": apiKey as AnyObject]
        default:
            return ["apiKey": apiKey as AnyObject]
        }
    }
}
