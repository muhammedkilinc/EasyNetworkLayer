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
    var dataArray: [Article] = []
    let cellType: CellProtocol.Type = NewsTableViewCell.self
    
    var source: Source!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: cellType.nibName(), bundle: nil), forCellReuseIdentifier: cellType.identifier())
        
        
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
                    
                    self.dataArray = item.articles
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                break
            }
        }
        
    }
    
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let item = dataArray[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: true)
       
        
    }
}

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data: Any?
        
        data = dataArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier(), for: indexPath)
        
        if let cell = cell as? CellProtocol {
            cell.config(data)
        }
        
        return cell
        
    }
    
    
}
