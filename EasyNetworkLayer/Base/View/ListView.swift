//
//  ListView.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 30.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

protocol ListView: class {
    func refreshList(dataArray: [Any])
    func displayFetchError(title: String, message: String)
}
