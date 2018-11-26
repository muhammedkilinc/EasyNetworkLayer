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
    var tableViewDataSource: TableViewDataSource<Any, NewsTableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        activityIndicatorView.hidesWhenStopped = true

        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableViewDataSource = TableViewDataSource<Any, NewsTableViewCell>(tableView: tableView)
        tableView.dataSource = tableViewDataSource
        
        configurator.configure(tableViewController: self, source: source)
        presenter.viewDidLoad()
        tableView.delegate = self
    }
    
    func startActivityIndicator() {
        activityIndicatorView.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicatorView.stopAnimating()
    }
    
    func refreshSourceListView() {
        tableViewDataSource.dataArray = presenter.dataArray
    }
    
    func displayFetchError(title: String, message: String) {
        print("\(title) -- \(message)")
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
    }
}
