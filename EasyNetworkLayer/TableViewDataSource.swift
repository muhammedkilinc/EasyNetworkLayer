//
//  TableViewDataSource.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 16.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

typealias CellTypeData = (data: Any, type: BaseCell.Type)

final class TableViewMultiTypeDataSource: NSObject, UITableViewDataSource {
    
    var dataSource: [CellTypeData] = [] {
        didSet { tableView.reloadData() }
    }
    
    private unowned var tableView: UITableView
    
    init(tableView: UITableView, cellTypes: [BaseCell.Type]) {
        cellTypes.forEach { (item) in
            tableView.registerReusableCell(item)
        }
        
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.dataSource[indexPath.row]

        let cell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.config(item.data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
}


final class TableViewDataSource<Model: Any, Cell: BaseCell>: NSObject, UITableViewDataSource {
    
    var dataSource: [Model] = [] {
        didSet { tableView.reloadData() }
    }
    
    private unowned var tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        
        tableView.registerReusableCell(Cell.self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.config(dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
}



