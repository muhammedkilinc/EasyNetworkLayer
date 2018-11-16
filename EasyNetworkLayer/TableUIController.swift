//
//  TableUIController.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 9.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

class DynamicTableUIController<Model: Any, Cell: BaseCell> {
    
    unowned var view: UIView
    var tableViewDataSource: TableViewDataSource<Model, Cell>!

    init(view: UIView, tableView: UITableView) {
        
        self.view = view
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableViewDataSource = TableViewDataSource<Model, Cell>(tableView: tableView)
        tableView.dataSource = tableViewDataSource
    }
    
}
