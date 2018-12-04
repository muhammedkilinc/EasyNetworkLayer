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

class SourceListTableViewController: UITableViewController, SourceListView, BaseTableViewController {

    var presenter: SourcePresenter!
    var dataSource: NewTableDataSource<Source, SourceTableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "News API"
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.registerReusableCell(type: SourceTableViewCell.self)
        dataSource = NewTableDataSource<Source, SourceTableViewCell>()
        tableView.dataSource = dataSource
        
        presenter.viewDidLoad()
        tableView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Categories", style: .done, target: self, action: #selector(self.touchedCategoryButton(_:)))
    }
    
    @objc func touchedCategoryButton(_ sender: Any) {
        presenter.openCategoryScreen()
    }
    
    // MARK: - SourceListView
    func refreshList(dataArray: [Any]) {
        if let items = dataArray as? [Source] {
            self.show(items: items)
        }
    }
    
    func displayFetchError(title: String, message: String) {
        print("\(title) -- \(message)")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
    
}
