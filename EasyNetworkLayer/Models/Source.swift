//
//  Source.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 6.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

public struct SourceResponse {
    public var sources: [Source]
    public var status: String
}
extension SourceResponse: Decodable {
    
}


public struct Source {
    
    public var id: String
    public var name: String
    public var description: String?
    public var category: String?
    public var language: String?
    public var country: String?
    public var url: URL?
}

extension Source: BaseEntity {

}

extension Source: Decodable {

}
