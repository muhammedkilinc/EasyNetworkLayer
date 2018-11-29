//
//  NewsCategoryPresenter.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 29.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

protocol CategoryPresenter: ListPresenter {
}

class CategoryPresenterImplementation: CategoryPresenter {
    weak var view: NewsCategoryView?
    var dataArray: [Any] = []
    private let wireframe: NewsCategoryWireframe
    
    init(view: NewsCategoryView, wireframe: NewsCategoryWireframe) {
        self.view = view
        self.wireframe = wireframe
    }
    
    // MARK: - SourceListPresenter
    
    func viewDidLoad() {
        self.prepareData()
    }
    
    func prepareData() {
        self.dataArray = NewsCategory.allCases
        handleDataReceived(self.dataArray)
    }
    
    func didSelect(row: Int) {
        let item = dataArray[row]
//        if let data = item as? Source {
////            wireframe.presentSourceDetailViewController(data)
//        }
    }
    
    // MARK: - Private
    
    fileprivate func handleDataReceived(_ dataArray: [Any]) {
        self.dataArray = dataArray
        view?.refreshList(dataArray: self.dataArray)
    }
    
    fileprivate func handleError(_ error: Error) {
        // Here we could check the error code and display a localized error message
        view?.displayFetchError(title: "Error", message: error.localizedDescription)
    }
    
}
