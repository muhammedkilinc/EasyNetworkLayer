//
//  Fetcher.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 6.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation



public class Fetcher {
    
    let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    private func fetchData(endpointType: Endpoint, handler: @escaping handler) {
        
        guard let request = endpointType.request else {
            handler(.error(.url))
            return
        }
        
        urlSession.dataTask(with: request, completionHandler: { data, response, error in
            if let data = data {
                handler(.success(result: data))
            } else {
                handler(.error(FetchError.other(description: error?.localizedDescription ?? "")))
            }
        }).resume()
        
    }
    
    public func fetch<ObjectType: Decodable>(endpointType: Endpoint, objectType: ObjectType.Type = ObjectType.self, handler: @escaping handler) {
        
        self.fetchData(endpointType: endpointType) { result in
            
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
