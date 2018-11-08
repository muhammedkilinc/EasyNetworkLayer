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
    let cellType: CellProtocol.Type = SourceTableViewCell.self

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension

        tableView.register(UINib(nibName: cellType.nibName(), bundle: nil), forCellReuseIdentifier: cellType.identifier())

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

        let vc = NewsListViewController.instantiateFromStoryboard()
        vc.source = item
        self.navigationController?.pushViewController(vc, animated: true)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
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
