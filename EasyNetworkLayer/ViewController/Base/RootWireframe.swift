//
//  RootWireFrame.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 27.11.2018.
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
