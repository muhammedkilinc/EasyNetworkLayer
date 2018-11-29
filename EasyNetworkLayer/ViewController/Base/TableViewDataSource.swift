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
    
    var dataArray: [CellTypeData] = [] {
        didSet { tableView.reloadData() }
    }
    
    private unowned var tableView: UITableView
    
    init(tableView: UITableView, cellTypes: [BaseCell.Type]) {
        cellTypes.forEach { (item) in
            tableView.registerReusableCell(type: item)
        }
        
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.dataArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(type: item.type, indexPath: indexPath)
        cell.config(item.data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
}


final class TableViewDataSource<Model, Cell: BaseCell>: NSObject, UITableViewDataSource, BaseTableDataSource where Model == Cell.Model {
    
    var dataArray: [Model] = []
    var delegate: CellDelegate?
    
    init(delegate: CellDelegate? = nil) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeueReusableCell(type: Cell.self, indexPath: indexPath)
        cell.config(dataArray[indexPath.row])
        
        if let cell = cell as? CellDelegateProtocol {
            cell.delegate = delegate
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }    
}