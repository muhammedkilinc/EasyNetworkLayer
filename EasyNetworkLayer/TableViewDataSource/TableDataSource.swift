//
//  TableDataSource.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 29.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

public protocol CellDelegate {

}

public protocol BaseTableDataSource {
    associatedtype Model
    var dataArray: [Model] { get set }
}

public protocol BaseTableViewController: class {
    var tableView: UITableView! { get }
    associatedtype DataSource: BaseTableDataSource
    var dataSource: DataSource! { get set }
}

extension BaseTableViewController {
    public func show(items: [DataSource.Model]) {
        dataSource.dataArray = items
        tableView.reloadData()
    }
}
