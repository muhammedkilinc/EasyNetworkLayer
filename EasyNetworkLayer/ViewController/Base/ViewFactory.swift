//
//  ViewFactory.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 27.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

class ViewFactory {
    
    static let sharedInstance = ViewFactory()
    let navigatorContainer = NavigatorContainer()
    
    private init() { }
    
    func provideSeriesNavigator() -> UINavigationController? {
        return navigatorContainer.resolve()
    }
    
    func provideRootNavController() -> UINavigationController {
        let navController: UINavigationController = UINavigationController(rootViewController: provideSourceViewController())
        navigatorContainer.register(navigationController: navController)
        return navController
    }
    
    func provideSourceViewController() -> SourceListTableViewController {
        let viewController: SourceListTableViewController = SourceListTableViewController.instantiateFromStoryboard()
        let presenter = SourcePresenterImplementation(view: viewController, endPoint: NewsFeed.getSources, wireframe: SourcesWireframe(viewFactory: ViewFactory.sharedInstance))
        viewController.presenter = presenter
        return viewController
    }
    
    
    func provideSourceDetailViewController(_ source: Source) -> NewsListViewController {
        let viewController: NewsListViewController = NewsListViewController.instantiateFromStoryboard()        
        let endPoint = NewsFeed.getTopHeadlines(countryId: nil, category: nil, sources: [source.id], query: nil)
        let presenter = NewsPresenterImplementation(view: viewController, endPoint: endPoint, source: source)
        viewController.presenter = presenter
        return viewController
    }
}
