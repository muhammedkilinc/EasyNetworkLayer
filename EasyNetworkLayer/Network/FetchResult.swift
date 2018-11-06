//
//  FetchResult.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 6.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

public typealias handler = (FetchResult) -> Void

public enum FetchResult {
    case error(_: FetchError)
    case success(result: Any?)
}
