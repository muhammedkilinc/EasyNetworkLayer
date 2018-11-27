//
//  NewsListPresenter.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 23.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

protocol NewsPresenter: ListPresenter {
}

class NewsPresenterImplementation: NewsPresenter {
    fileprivate weak var view: NewsListView?
//    internal let router: ListViewRouter
    var endPoint: Endpoint
    var dataArray: [Any] = []
    var source: Source

    init(view: NewsListView, endPoint: Endpoint, source: Source) {
        self.view = view
//        self.router = router
        self.endPoint = endPoint
        self.source = source
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
//        router.presentDetailsView(for: item)
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
