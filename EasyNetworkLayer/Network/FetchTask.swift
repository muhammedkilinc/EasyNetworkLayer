//
//  FetchTask.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 7.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

public enum FetchTask {
    case request
    case requestParameters(bodyParameters: Parameters?, bodyEncoding: ParameterEncoding, urlParameters: Parameters?, headers: Parameters?)
}
