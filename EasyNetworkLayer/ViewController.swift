//
//  ViewController.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 6.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataArray: [Source] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let fetcher = Fetcher()
        fetcher.fetch(endpointType: NewsFeed.getSources, objectType: SourceResponse.self) { (result) in
            switch result {
            case .error(let error):
                print(error)
                break
            case .success(result: let result):
                if let item = result as? SourceResponse {
                    print(item.sources)
                    
                    self.dataArray = item.sources
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }

                }
                break
            }
        }
        
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataArray[indexPath.row]

        tableView.deselectRow(at: indexPath, animated: true)
        let fetcher = Fetcher()
        let endPoint = NewsFeed.getTopHeadlines(countryId: "tr", category: nil, sources: [item.id], query: nil)
        fetcher.fetch(endpointType: endPoint, objectType: ArticleResponse.self) { (result) in
            switch result {
            case .error(let error):
                print(error)
                break
            case .success(result: let result):
                if let item = result as? ArticleResponse {
                    print(item.articles)
                }
                break
            }
        }

    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row].name
        return cell
    
    }
    
    
}
