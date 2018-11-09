//
//  CellProtocol.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

public protocol CellProtocol: class {
    static func identifier() -> String
    static func nibName() -> String

    func config(_ data: Any?)
}

extension CellProtocol {
    static func identifier() -> String {
        return String(describing: self) + "identifier"
    }
    
    static func nibName() -> String {
        return String(describing: self)
    }
}

class BaseCell: UITableViewCell, CellProtocol {
    func config(_ data: Any?) {
        
    }
}

extension UITableView {
    
    func registerReusableCell<T: BaseCell>(_: T.Type) {
//        register(T.self, forCellReuseIdentifier: T.identifier())
        register(UINib(nibName: T.nibName(), bundle: nil), forCellReuseIdentifier: T.identifier())
    }
    
    func dequeueReusableCell<T: BaseCell>(indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.identifier(), for: indexPath as IndexPath) as! T
    }
}


final class TableViewDataSource<Model: Any, Cell: BaseCell>: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.config(dataSource[indexPath.row])
        return cell
    }
    
    
    var dataSource: [Model] = [] {
        didSet { tableView.reloadData() }
    }
    
    private unowned var tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        
        tableView.registerReusableCell(Cell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
}



