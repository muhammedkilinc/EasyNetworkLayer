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
    func refreshSourceListView(dataArray: [Any])
    func displayFetchError(title: String, message: String)
}

protocol ListPresenter {
    var router: ListViewRouter { get }
    var dataArray: [Any] { get set }
    var endPoint: Endpoint { get }
    
    func viewDidLoad()
    func didSelect(row: Int)
}

extension ListPresenter {
    
}

protocol ViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

extension ViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}


protocol ListViewRouter: ViewRouter {
    func presentDetailsView(for source: Any)
}

protocol ListConfigurator {

}
