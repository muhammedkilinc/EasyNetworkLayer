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
    let cellType: CellProtocol.Type = SourceTableViewCell.self
    
    var tableViewDataSource: TableViewDataSource<Any, SourceTableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension

        self.tableViewDataSource = TableViewDataSource<Any, SourceTableViewCell>(tableView: tableView)
        
        self.tableView.dataSource = self.tableViewDataSource
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
                    DispatchQueue.main.async {
                        self.tableViewDataSource.dataSource = item.sources
                    }
                }
                break
            }
        }
        
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = self.tableViewDataSource.dataSource[indexPath.row] as? Source {
            let vc = NewsListViewController.instantiateFromStoryboard()
            vc.source = item
            self.navigationController?.pushViewController(vc, animated: true)
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let data: Any?
//
//        data = dataArray[indexPath.row]
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier(), for: indexPath)
//
//        if let cell = cell as? CellProtocol {
//            cell.config(data)
//        }
//
//        return cell
//
//    }
//
//
//}
