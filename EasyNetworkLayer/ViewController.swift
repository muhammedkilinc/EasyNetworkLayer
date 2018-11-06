//
//  ViewController.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 6.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let fetcher = Fetcher()
//        fetcher.fetch(ofObjectType: SourceResponse.self, atURL: "sources", parameters: ["apiKey": "3073a66586c646cb8ca68c805efdff12" as AnyObject]) { (result) in
//            switch result {
//            case .error(let error):
//                print(error)
//                break
//            case .success(result: let result):
//                if let items = result as? SourceResponse {
//                   print(items.sources)
//                }
//                break
//            }
//        }
        
        let fetcher = Fetcher()
        fetcher.fetch(ofObjectType: ArticleResponse.self, atURL: "top-headlines", parameters: ["country": "tr" as AnyObject,"apiKey": "3073a66586c646cb8ca68c805efdff12" as AnyObject]) { (result) in
            switch result {
            case .error(let error):
                print(error)
                break
            case .success(result: let result):
                if let items = result as? ArticleResponse {
                    print(items.articles)
                }
                break
            }
        }
        
    }

    
    
}

