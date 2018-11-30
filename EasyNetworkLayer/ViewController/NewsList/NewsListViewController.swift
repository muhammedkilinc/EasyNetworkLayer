//
//  NewsListViewController.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import UIKit

protocol NewsListView: ListView, LoadingView {
}

class NewsListViewController: UIViewController, NewsListView {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    var presenter: NewsPresenter!
    var dataSource: TableDataSource<Article, NewsTableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        activityIndicatorView.hidesWhenStopped = true

        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.registerReusableCell(type: NewsTableViewCell.self)
        dataSource = TableDataSource<Article, NewsTableViewCell>()
        tableView.dataSource = dataSource
        
        presenter.viewDidLoad()
        tableView.delegate = self
    }
    
    func startActivityIndicator() {
        activityIndicatorView.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicatorView.stopAnimating()
    }
    
    func refreshList(dataArray: [Any]) {
        if let items = dataArray as? [Article] {
            dataSource.dataArray = items
            tableView.reloadData()
        }
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
