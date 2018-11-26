//
//  TableUIController.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 9.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

class DynamicTableUIController {
    
    unowned var view: UIView
    var tableViewDataSource: TableViewMultiTypeDataSource!

    init(view: UIView, tableView: UITableView, cellTypes: [BaseCell.Type]) {
        
        self.view = view
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableViewDataSource = TableViewMultiTypeDataSource(tableView: tableView, cellTypes: cellTypes)
        tableView.dataSource = tableViewDataSource
    }
}
