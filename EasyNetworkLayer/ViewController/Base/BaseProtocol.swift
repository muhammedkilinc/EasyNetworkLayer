//
//  BaseProtocol.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 23.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

protocol ListView: class {
    func refreshList(dataArray: [Any])
    func displayFetchError(title: String, message: String)
}

protocol LoadingView: class {
    func startActivityIndicator()
    func stopActivityIndicator()
}

protocol ListPresenter {
    var dataArray: [Any] { get set }
    func viewDidLoad()
    func didSelect(row: Int)
}

extension ListPresenter {
    
}

protocol FetchListPresenter: ListPresenter {
    var endPoint: Endpoint { get }
}

