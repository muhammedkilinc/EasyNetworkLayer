//
//  SourceListConfigurator.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 23.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

protocol SourceListConfigurator: ListConfigurator {
    func configure(tableViewController: SourceListTableViewController)
}

class SourceListConfiguratorImplementation: SourceListConfigurator {
    func configure(tableViewController: SourceListTableViewController) {
        let router = SourceListViewRouterImplementation(tableViewController: tableViewController)
        let presenter = SourcePresenterImplementation(view: tableViewController, router: router, endPoint: NewsFeed.getSources)
        tableViewController.presenter = presenter
    }
}
