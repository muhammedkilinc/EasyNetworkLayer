//
//  Encoders.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 7.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum ParameterEncoding {
    
    case urlEncoding
    case jsonEncoding
    
    public func encode(urlRequest: inout URLRequest, bodyParameters: Parameters?, urlParameters: Parameters?) throws {
        do {
            switch self {
            case .urlEncoding:
                guard let urlParameters = urlParameters else { return }
                
                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
            case .jsonEncoding:
                guard let bodyParameters = bodyParameters else { return }
                
                try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
            }
        } catch {
            throw error
        }
    }
}

public struct URLParameterEncoder: ParameterEncoder {
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        
        guard let url = urlRequest.url else { throw FetchError.url }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            
            urlComponents.queryItems = parameters.map { (element) -> URLQueryItem in
                return URLQueryItem(name: element.key, value: (element.value as AnyObject).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
            }
            
            urlRequest.url = urlComponents.url
        }
        
        urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }
}


public struct JSONParameterEncoder: ParameterEncoder {
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            throw FetchError.encode
        }
    }
}

