//
//  SourceViewModel.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

struct SourceViewModel {
    
    weak var dataSource : GenericDataSource?
    
    init(dataSource : GenericDataSource?) {
        self.dataSource = dataSource
    }
    
    func fetchSources(_ handler: handler? = nil) {
        
        let fetcher = Fetcher()
        fetcher.fetch(endpointType: NewsFeed.getSources, objectType: SourceResponse.self) { (result) in
            switch result {
            case .error(let error):
                print(error)
                break
            case .success(result: let result):
                if let item = result as? SourceResponse {
                    print(item.sources)
                    DispatchQueue.main.async {
                        self.dataSource?.data.value = item.sources
                    }
                }
                break
            }
            handler?(result)
        }
        
    }
}
