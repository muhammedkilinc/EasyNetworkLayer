//
//  Fetcher.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 6.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

public let baseUrl = "newsapi.org"

public typealias URLParameter = [String: AnyObject]?

public class Fetcher: NSObject {
    
    let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    private func fetchData(atURL urlString: String, parameters: URLParameter?, handler: @escaping handler) {
        
        let possibleURL: URL?
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseUrl
        
        var slashAddedUrlString = urlString
        if !urlString.hasPrefix("/") {
            slashAddedUrlString = "/v2" + "/".appending(urlString)
        }
        components.path = slashAddedUrlString
        
        if let parameters = parameters {
            components.queryItems = parameters?.map({ element in
                return URLQueryItem(name: element.key, value: element.value as? String)
            })
        }
        
        possibleURL = components.url
        
        guard let url = possibleURL else {
            handler(.error(FetchError.url))
            return
        }
        
        #if DEBUG
        print("RequestURL: \(url)")
        #endif
        
        urlSession.dataTask(with: URLRequest(url: url), completionHandler: { data, response, error in
            if let data = data {
                handler(.success(result: data))
            } else {
                handler(.error(FetchError.other(description: error?.localizedDescription ?? "")))
            }
        }).resume()
        
    }
    
    public func fetch<ObjectType: Decodable>(ofObjectType objectType: ObjectType.Type = ObjectType.self, atURL urlString: String, parameters: URLParameter = nil, handler: @escaping handler) {
        
        self.fetchData(atURL: urlString, parameters: parameters) { result in
            
            switch result {
            case .error( _):
                handler(result)
            case .success(result: let result):
                guard let data = result as? Data else {
                    handler(.error(FetchError.parseJSON))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let genericModel = try decoder.decode(objectType, from: data)
                    handler(.success(result: genericModel))
                }
                catch let error {
                    handler(.error(FetchError.other(description: error.localizedDescription)))
                }
            }
            
        }
        
    }
    
}
