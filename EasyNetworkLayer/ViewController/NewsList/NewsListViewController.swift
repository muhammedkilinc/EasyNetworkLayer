//
//  NewsListViewController.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController, NewsListView {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    var source: Source!
    var configurator = NewsListConfiguratorImplementation()
    var presenter: NewsPresenter!
    var UIController: TableUIController<Any, NewsTableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        activityIndicatorView.hidesWhenStopped = true
        UIController = TableUIController<Any, NewsTableViewCell>(view: self.view, tableView: self.tableView)
        
        configurator.configure(tableViewController: self, source: source)
        presenter.viewDidLoad()
        self.tableView.delegate = self
    }
    
    func startActivityIndicator() {
        activityIndicatorView.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicatorView.stopAnimating()
    }
    
    func refreshSourceListView() {
        self.UIController.tableViewDataSource.dataSource = presenter.dataArray
    }
    
    func displayFetchError(title: String, message: String) {
        print("\(title) -- \(message)")
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
