//
//  NewsCategoryViewController.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 29.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

class NewsCategoryTableViewController: UITableViewController, NewsCategoryView {
    
    var presenter: CategoryPresenter!
    var tableViewDataSource: TableViewDataSource<Any, CategoryTableViewCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Categories"
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableViewDataSource = TableViewDataSource<Any, CategoryTableViewCell>(tableView: tableView, delegate: self)
        tableView.dataSource = tableViewDataSource
        
        presenter.viewDidLoad()
        tableView.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
    
    // MARK: - SourceListView
    func refreshList(dataArray: [Any]) {
        tableViewDataSource.dataArray = dataArray
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
