//
//  NewsListRouter.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 26.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

protocol NewsListViewRouter: ListViewRouter {
}

class NewsListViewRouterImplementation: NewsListViewRouter {
    fileprivate weak var viewController: UIViewController?
    
    init(tableViewController: UIViewController) {
        self.viewController = tableViewController
    }
    
    // MARK: - NewsListViewRouter
    
    func presentDetailsView(for source: Any) {
        //TODO
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO
    }
}
