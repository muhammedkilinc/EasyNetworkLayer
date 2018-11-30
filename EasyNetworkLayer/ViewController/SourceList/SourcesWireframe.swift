//
//  SourceWireframe.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 27.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation


class SourcesWireframe: Wireframe {
    func presentSourceDetailViewController(_ source: Source) {
        let viewController = viewFactory.provideSourceDetailViewController(source)
        viewFactory.provideSourcesNavigator()?.pushViewController(viewController, animated: true)
    }
    
    func presentCategoryViewController() {
        let viewController = viewFactory.provideCategoryViewController()
        let navigationController = CategoryNavigationController(rootViewController: viewController)
        viewFactory.navigatorContainer.register(navigationController: navigationController)
        viewFactory.provideSourcesNavigator()?.present(navigationController, animated: true, completion: nil)
    }
    
    func presentCustomizeViewController() {
        let viewController = viewFactory.provideCustomizeViewController()
        viewFactory.provideSourcesNavigator()?.pushViewController(viewController, animated: true)
    }
    
}
