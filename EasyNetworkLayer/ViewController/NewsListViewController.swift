//
//  NewsListViewController.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var UIController: DynamicTableUIController<Any, NewsTableViewCell>!
    
    var source: Source!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.UIController = DynamicTableUIController<Any, NewsTableViewCell>(view: self.view, tableView: self.tableView)
        
        self.tableView.delegate = self
        self.fetchData()
    }
    
    func fetchData() {
        let fetcher = Fetcher()
        let endPoint = NewsFeed.getTopHeadlines(countryId: nil, category: nil, sources: [source.id], query: nil)
        fetcher.fetch(endpointType: endPoint, objectType: ArticleResponse.self) { (result) in
            switch result {
            case .error(let error):
                print(error)
                break
            case .success(result: let result):
                if let item = result as? ArticleResponse {
                    print(item.articles)
                    
                    DispatchQueue.main.async {
                        self.UIController.tableViewDataSource.dataSource = item.articles
                    }
                }
                break
            }
        }
    }
    
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
