//
//  NavigationContainer.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 27.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

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
