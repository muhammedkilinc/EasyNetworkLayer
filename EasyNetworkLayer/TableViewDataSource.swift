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

final class TableViewDataSource: NSObject, UITableViewDataSource {
    
    var dataSource: [CellTypeData] = [] {
        didSet { tableView.reloadData() }
    }
    var cellTypes: [BaseCell.Type] = [] {
        didSet {
            cellTypes.forEach { (item) in
                tableView.registerReusableCell(item)
            }
        }
    }
    
    private unowned var tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.dataSource[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: item.type.identifier, for: indexPath)
        if let cell = cell as? CellProtocol {
            cell.config(item.data)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
}
