//
//  SourceListPresenter.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 23.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation


protocol SourcePresenter: ListPresenter {
}

class SourcePresenterImplementation: SourcePresenter {
    weak var view: SourceListView?
    var router: ListViewRouter
    var endPoint: Endpoint
    var dataArray: [Any] = []
    
    init(view: SourceListView, router: SourceListViewRouter, endPoint: Endpoint) {
        self.view = view
        self.router = router
        self.endPoint = endPoint
    }
    
    // MARK: - SourceListPresenter
    
    func viewDidLoad() {
        self.fetchData()
    }
    
    func fetchData() {
        let fetcher = Fetcher()
        fetcher.fetch(endpointType: self.endPoint, objectType: SourceResponse.self) { (result) in
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
        view?.displayFetchError(title: "Error", message: error.localizedDescription)
    }
    
}
