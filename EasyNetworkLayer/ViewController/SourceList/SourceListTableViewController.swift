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

    var configurator = SourceListConfiguratorImplementation()
    var presenter: SourcePresenter!
    var UIController: TableUIController<Any, SourceTableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIController = TableUIController<Any, SourceTableViewCell>(view: self.view, tableView: self.tableView)
        
        configurator.configure(tableViewController: self)
        presenter.viewDidLoad()
        self.tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }

    // MARK: - SourceListView
    func refreshSourceListView() {
        self.UIController.tableViewDataSource.dataSource = presenter.dataArray
    }
    
    func displayFetchError(title: String, message: String) {
        print("\(title) -- \(message)")
    }
    
}

