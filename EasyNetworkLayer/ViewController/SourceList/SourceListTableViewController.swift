//
//  SourceListTableViewController.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 22.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import UIKit

protocol SourceListView: ListView {

}

class SourceListTableViewController: UITableViewController, SourceListView {
    
    var presenter: SourcePresenter!
    var tableViewDataSource: TableViewDataSource<Any, SourceTableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableViewDataSource = TableViewDataSource<Any, SourceTableViewCell>(tableView: tableView)
        tableView.dataSource = tableViewDataSource
        
        presenter.viewDidLoad()
        tableView.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }

    // MARK: - SourceListView
    func refreshSourceListView(dataArray: [Any]) {
        tableViewDataSource.dataArray = dataArray
    }
    
    func displayFetchError(title: String, message: String) {
        print("\(title) -- \(message)")
    }
    
}

