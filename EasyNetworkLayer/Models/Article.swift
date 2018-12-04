//
//  Article.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 6.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

public struct ArticleResponse {
    public var articles: [Article]
    public var status: String
    public var totalResults: Int
}

extension ArticleResponse: Decodable {
    
}

public struct Article {
    public var title: String
    public var author: String?
    public var description: String?
    public var url: URL?
    public var publishedAt: String?
    public var urlToImage: URL?
    public var content: String?
    public var source: Source?
}

extension Article: Decodable {
    
}

extension Article: BaseEntity {
    
}
