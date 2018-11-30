//
//  CustomizeWireframe.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 30.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

class CustomizeWireframe: Wireframe {
    func presentCategoryViewController() {
        let viewController = viewFactory.provideCategoryViewController()
        viewFactory.provideSourcesNavigator()?.pushViewController(viewController, animated: true)
    }
}
