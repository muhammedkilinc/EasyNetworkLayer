//
//  NewsListPresenter.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 23.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

protocol NewsListView: ListView {
    func startActivityIndicator()
    func stopActivityIndicator()
}

protocol NewsPresenter: ListPresenter {
}

protocol NewsListViewRouter: ListViewRouter {
}

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


class NewsPresenterImplementation: NewsPresenter {
    fileprivate weak var view: NewsListView?
    internal let router: ListViewRouter
    var endPoint: Endpoint
    var dataArray: [Any] = []
    
    init(view: NewsListView, router: NewsListViewRouter, endPoint: Endpoint) {
        self.view = view
        self.router = router
        self.endPoint = endPoint
    }
    
    // MARK: - NewsListPresenter
    
    func viewDidLoad() {
        self.fetchData()
    }
    
    func fetchData() {
        view?.startActivityIndicator()
        let fetcher = Fetcher()
        fetcher.fetch(endpointType: self.endPoint, objectType: ArticleResponse.self) { (result) in
            DispatchQueue.main.async {
                self.view?.stopActivityIndicator()
            }
            switch result {
            case .error(let error):
                print(error)
                self.handleError(error)
                break
            case .success(result: let result):
                if let item = result as? ArticleResponse {
                    print(item.articles)
                    DispatchQueue.main.async {
                        self.handleDataReceived(item.articles)
                    }
                }
                break
            }
        }
    }
    
    func didSelect(row: Int) {
        let item = dataArray[row]
        router.presentDetailsView(for: item)
    }
    
    // MARK: - Private
    
    fileprivate func handleDataReceived(_ dataArray: [Any]) {
        self.dataArray = dataArray
        view?.refreshSourceListView(dataArray: self.dataArray)
    }
    
    fileprivate func handleError(_ error: Error) {
        // Here we could check the error code and display a localized error message
        view?.displayFetchError(title: "Error", message: error.localizedDescription)
    }
    
}
