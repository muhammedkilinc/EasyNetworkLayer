//
//  Wireframe.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 26.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

class RootWireframe: Wireframe {
    func presentInitialViewController(inWindow window: UIWindow) {
        let viewController = viewFactory.provideRootNavController()
        window.rootViewController = viewController
    }
}
    
class Wireframe {
    var viewFactory: ViewFactory {
        return ViewFactory.sharedInstance
    }
}


class SourcesWireframe: Wireframe {
    func presentSourceDetailViewController(_ source: Source) {
        let viewController = viewFactory.provideSourceDetailViewController(source)
        viewFactory.provideSeriesNavigator()?.pushViewController(viewController, animated: true)
    }
}

open class NavigatorContainer {
    private var container: [String : UINavigationController] = [ : ]
    
    public init() {
    }
    
    @discardableResult
    open func register<T: UINavigationController>(navigationController: T) -> T {
        container[String(describing: T.self)] = navigationController
        return navigationController
    }
    
    open func resolve<T: UINavigationController>() -> T? {
        return (container[String(describing: T.self)] as! T)
    }
}


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
        
        let router = SourceListViewRouterImplementation(tableViewController: viewController)
        let presenter = SourcePresenterImplementation(view: viewController, router: router, endPoint: NewsFeed.getSources, wireframe: SourcesWireframe())
        viewController.presenter = presenter
        return viewController
    }
    
    
    func provideSourceDetailViewController(_ source: Source) -> NewsListViewController {
        let viewController: NewsListViewController = NewsListViewController.instantiateFromStoryboard()
        
        let endPoint = NewsFeed.getTopHeadlines(countryId: nil, category: nil, sources: [source.id], query: nil)
        let router = NewsListViewRouterImplementation(tableViewController: viewController)
        let presenter = NewsPresenterImplementation(view: viewController, router: router, endPoint: endPoint, source: source)
        viewController.presenter = presenter
        return viewController
    }
}
