//
//  SourceListPresenter.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 23.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

protocol SourcePresenter {
//    var numberOfItems: Int { get }
    var router: SourceListViewRouter { get }
    func viewDidLoad()
//    func configure(cell: BaseCell, forRow row: Int)
    func didSelect(row: Int)
    var dataArray: [Any] { get set }
}

class SourcePresenterImplementation: SourcePresenter {
    fileprivate weak var view: SourceListView?
    internal let router: SourceListViewRouter
    
    var dataArray: [Any] = []
    
//    var numberOfItems: Int {
//        return dataArray.count
//    }
    
    init(view: SourceListView, router: SourceListViewRouter) {
        self.view = view
        self.router = router
    }
    
    // MARK: - SourceListPresenter
    
    func viewDidLoad() {
        self.fetchData()
    }
    
    func fetchData() {
        let fetcher = Fetcher()
        fetcher.fetch(endpointType: NewsFeed.getSources, objectType: SourceResponse.self) { (result) in
            switch result {
            case .error(let error):
                print(error)
                self.handleError(error)
                break
            case .success(result: let result):
                if let item = result as? SourceResponse {
                    print(item.sources)
                    DispatchQueue.main.async {
                        self.handleDataReceived(item.sources)
                    }
                }
                break
            }
        }
    }
    
//    func configure(cell: BaseCell, forRow row: Int) {
//        let item = dataArray[row]
//        cell.config(item)
//    }
    
    func didSelect(row: Int) {
        let item = dataArray[row]
        router.presentDetailsView(for: item)
    }
    
    // MARK: - Private
    
    fileprivate func handleDataReceived(_ dataArray: [Any]) {
        self.dataArray = dataArray
        view?.refreshSourceListView()
    }
    
    fileprivate func handleError(_ error: Error) {
        // Here we could check the error code and display a localized error message
        view?.displayBooksRetrievalError(title: "Error", message: error.localizedDescription)
    }
    
}
