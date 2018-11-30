//
//  ListPresenter.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 30.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

protocol ListPresenter {
    var dataArray: [Any] { get set }
    func viewDidLoad()
    func didSelect(row: Int)
}

extension ListPresenter {
    
}
