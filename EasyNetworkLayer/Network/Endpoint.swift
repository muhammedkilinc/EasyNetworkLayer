//
//  Endpoint.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 6.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

public protocol Endpoint {
    var path: String { get }
    var parameters: Parameters? { get }
    var task: FetchTask { get }
    var type: FetchMethod { get }
}

public extension Endpoint {
    
    public var base: String {
        return "newsapi.org"
    }
    
    public var apiKey: String {
        return "3073a66586c646cb8ca68c805efdff12"
    }
    
    public var additionalHeaders: Parameters {
        return ["Authorization": "Bearer \(apiKey)"]
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = base
        
        var fullPath = path
        fullPath = "/v2" + "/".appending(path)

        components.path = fullPath
        
        return components
    }
    
    var request: URLRequest? {
        guard let url = urlComponents.url else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = self.type.rawValue

        do {
            switch self.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters, let bodyEncoding, let urlParameters, let headers):
                self.addAdditionalHeaders(headers, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, bodyEncoding: bodyEncoding, urlParameters: urlParameters, request: &request)
            }
            
            return request
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureParameters(bodyParameters: Parameters?, bodyEncoding: ParameterEncoding, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request, bodyParameters: bodyParameters, urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: Parameters?, request: inout URLRequest) {
        guard let headers = additionalHeaders as? [String: String] else { return }
        
        headers.forEach { (element) in
            request.setValue(element.value, forHTTPHeaderField: element.key)
        }
    }
}

public enum NewsFeed {
    case getSources
    case getTopHeadlines(countryId: String?, category: String?, sources: [String]?, query: String?)
}

extension NewsFeed: Endpoint {
    
    public var type: FetchMethod {
        return .GET
    }
    
    public var task: FetchTask {
        switch self {
        case .getSources:
            return FetchTask.requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: parameters, headers: additionalHeaders)
        case .getTopHeadlines( _):
            return FetchTask.requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: parameters, headers: additionalHeaders)
        }
    }
    
    public var path: String {
        switch self {
        case .getSources:
            return "sources"
        case .getTopHeadlines( _):
            return "top-headlines"
        }
    }
    
    public var parameters: Parameters? {
        switch self {
        case .getTopHeadlines(let countryId, let category, let sources, let query):
            var params: [String: Any] = [:]
            if let sources = sources {
                params["sources"] = sources.joined(separator: ",")
            } else {
                if let country = countryId {
                    params["country"] = country
                }
                if let category = category {
                    params["category"] = category
                }
                if let query = query {
                    params["q"] = query
                }
            }
            return params
        default:
            return [:]
        }
    }
    
}
