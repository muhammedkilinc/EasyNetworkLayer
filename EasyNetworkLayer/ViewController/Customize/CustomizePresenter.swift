//
//  CustomizePresenter.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 30.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

enum CustomizeItem: CustomStringConvertible, CaseIterable {
    case language, country, sources, category
    
    var description: String {
        switch self {
        case .language:
            return "Language"
        case .country:
            return "Country"
        case .sources:
            return "Sources"
        case .category:
            return "Category"
        }
    }
}

protocol CustomizePresenter: ListPresenter {
}

class CustomizePresenterImplementation: CustomizePresenter {
    weak var view: CustomizeView?
    var dataArray: [Any] = []
    private let wireframe: CustomizeWireframe
    
    init(view: CustomizeView, wireframe: CustomizeWireframe) {
        self.view = view
        self.wireframe = wireframe
    }
    
    // MARK: - SourceListPresenter
    
    func viewDidLoad() {
        self.prepareData()
    }
    
    func prepareData() {
        self.dataArray = CustomizeItem.allCases
        handleDataReceived(self.dataArray)
    }
    
    func didSelect(row: Int) {
        let item = dataArray[row]
        if let data = item as? CustomizeItem, data == .category {
            wireframe.presentCategoryViewController()
        }
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
