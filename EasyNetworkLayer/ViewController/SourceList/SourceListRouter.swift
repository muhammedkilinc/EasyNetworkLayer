//
//  SourceListRouter.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 23.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit


protocol SourceListViewRouter: ListViewRouter {
}

class SourceListViewRouterImplementation: SourceListViewRouter {
    fileprivate weak var viewController: UIViewController?
    fileprivate var source: Source!
    
    init(tableViewController: UIViewController) {
        self.viewController = tableViewController
    }
    
    // MARK: - SourceListViewRouter
    
    func presentDetailsView(for source: Any) {
        if let item = source as? Source {
            self.source = item
            viewController?.performSegue(withIdentifier: "NewsListViewController", sender: nil)
        }
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newsListTableViewController = segue.destination as? NewsListViewController {
//            newsListTableViewController.source = self.source
            //            bookDetailsTableViewController.configurator = BookDetailsConfiguratorImplementation(book: book)
        }
    }
}
