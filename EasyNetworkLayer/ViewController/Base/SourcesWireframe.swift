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
        viewFactory.provideSeriesNavigator()?.pushViewController(viewController, animated: true)
    }
}
