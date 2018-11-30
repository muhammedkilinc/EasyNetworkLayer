//
//  TableDataSource.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 16.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

final class TableDataSource<Model, Cell: CellProtocol>: NSObject, UITableViewDataSource, BaseTableDataSource where Cell.Model == Model {
    
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
        return cell as! UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
}
