//
//  File.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 26.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

protocol NewsListConfigurator: ListConfigurator {
    func configure(tableViewController: NewsListViewController, source: Source)
}

class NewsListConfiguratorImplementation: NewsListConfigurator {
    func configure(tableViewController: NewsListViewController, source: Source) {
        let endPoint = NewsFeed.getTopHeadlines(countryId: nil, category: nil, sources: [source.id], query: nil)
        let router = NewsListViewRouterImplementation(tableViewController: tableViewController)
        let presenter = NewsPresenterImplementation(view: tableViewController, router: router, endPoint: endPoint)
        tableViewController.presenter = presenter
    }
}
