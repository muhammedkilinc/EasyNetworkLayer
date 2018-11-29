//
//  NewsCategoryViewController.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 29.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

class NewsCategoryTableViewController: UITableViewController, NewsCategoryView, BaseTableViewController, CellDelegate {
    
    var presenter: CategoryPresenter!
    var dataSource: TableViewDataSource<Any, CategoryTableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Categories"
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.registerReusableCell(type: CategoryTableViewCell.self)
        dataSource = TableViewDataSource<Any, CategoryTableViewCell>(delegate: self)
        tableView.dataSource = dataSource
        
        presenter.viewDidLoad()
        tableView.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
    
    // MARK: - CategoryListView
    func refreshList(dataArray: [Any]) {
        self.show(items: dataArray)
//        dataSource.dataArray = dataArray
//        tableView.reloadData()
    }
    
    func displayFetchError(title: String, message: String) {
        print("\(title) -- \(message)")
    }
    
}


extension NewsCategoryTableViewController: CategoryTableCellDelegate {
    func valueChangedCategoryStatus(isActive: Bool) {
        print("isActive: \(isActive)")
    }
}
