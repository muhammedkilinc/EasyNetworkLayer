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

    var UIController: TableUIController<Any, SourceTableViewCell>!

//    var dynamicUIController: DynamicTableUIController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.UIController = TableUIController<Any, SourceTableViewCell>(view: self.view, tableView: self.tableView)
//        self.dynamicUIController = DynamicTableUIController(view: self.view, tableView: self.tableView, cellTypes: [SourceTableViewCell.self])

        self.tableView.delegate = self
        self.fetchData()
    }
    
    func fetchData() {
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
                        self.UIController.tableViewDataSource.dataSource = item.sources
                        
//                        var dataArray: [CellTypeData] = []
//                        item.sources.forEach({ (sourceItem) in
//                            dataArray.append(CellTypeData(data: sourceItem, type: SourceTableViewCell.self))
//                        })
//                        self.dynamicUIController.tableViewDataSource.dataSource = dataArray
                    }
                }
                break
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = self.UIController.tableViewDataSource.dataSource[indexPath.row] as? Source {
            let vc = NewsListViewController.instantiateFromStoryboard()
            vc.source = item
            self.navigationController?.pushViewController(vc, animated: true)

            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
