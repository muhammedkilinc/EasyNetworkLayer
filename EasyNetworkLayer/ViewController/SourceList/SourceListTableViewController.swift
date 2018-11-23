//
//  SourceListTableViewController.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 22.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import UIKit

protocol SourceListView: class {
    func refreshSourceListView()
    func displayBooksRetrievalError(title: String, message: String)
}


class SourceListTableViewController: UITableViewController, SourceListView {

    var configurator = SourceListConfiguratorImplementation()
    var presenter: SourcePresenter!
    var UIController: TableUIController<Any, SourceTableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()
        

//        tableView.registerReusableCell(type: cellType)
        
//        tableView.register(UINib(nibName: "SourceTableViewCell", bundle: nil), forCellReuseIdentifier: "CellIdentifier")
//        self.tableView.dataSource = self
        
        UIController = TableUIController<Any, SourceTableViewCell>(view: self.view, tableView: self.tableView)

        configurator.configure(tableViewController: self)
        presenter.viewDidLoad()
        self.tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
    
    // MARK: - UITableViewDataSource
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return presenter.numberOfItems
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(type: cellType, indexPath: indexPath)
//        presenter.configure(cell: cell, forRow: indexPath.row)
//
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
    
    // MARK: - SourceListView
    func refreshSourceListView() {
        self.UIController.tableViewDataSource.dataSource = presenter.dataArray
    }
    
    func displayBooksRetrievalError(title: String, message: String) {
        print("\(title) -- \(message)")
    }
    
}

