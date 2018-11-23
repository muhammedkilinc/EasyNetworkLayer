//
//  SourceListRouter.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 23.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

protocol ViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

extension ViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}


protocol SourceListViewRouter: ViewRouter {
    func presentDetailsView(for source: Any)
}


class SourceListViewRouterImplementation: SourceListViewRouter {
    fileprivate weak var tableViewController: SourceListTableViewController?
    fileprivate var source: Source!
    
    init(tableViewController: SourceListTableViewController) {
        self.tableViewController = tableViewController
    }
    
    // MARK: - SourceListViewRouter
    
    func presentDetailsView(for source: Any) {
        if let item = source as? Source {
            self.source = item
            tableViewController?.performSegue(withIdentifier: "NewsListViewController", sender: nil)
        }
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newsListTableViewController = segue.destination as? NewsListViewController {
            newsListTableViewController.source = self.source
            //            bookDetailsTableViewController.configurator = BookDetailsConfiguratorImplementation(book: book)
        }
    }
}
