//
//  CustomizeTableViewController.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 30.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import UIKit

class CustomizeTableViewController: UITableViewController, CustomizeView, BaseTableViewController, CellDelegate {
    
    var presenter: CustomizePresenter!
    var dataSource: TableDataSource<CustomizeItem, TitleTableViewCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Customize"
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.registerReusableCell(type: TitleTableViewCell.self)
        dataSource = TableDataSource<CustomizeItem, TitleTableViewCell>(delegate: self)
        tableView.dataSource = dataSource
        
        presenter.viewDidLoad()
        tableView.delegate = self
    }
    
    @objc func closeScreen() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
    
    // MARK: - CustomizeView
    func refreshList(dataArray: [Any]) {
        if let items = dataArray as? [CustomizeItem] {
            self.show(items: items)
        }
    }
    
    func displayFetchError(title: String, message: String) {
        print("\(title) -- \(message)")
    }
    
}
