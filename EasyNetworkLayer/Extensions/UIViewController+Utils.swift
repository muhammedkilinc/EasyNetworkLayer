//
//  UIViewController+Utils.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    class func instantiateFromStoryboard(_ name: String = "Main") -> Self {
        return instantiateFromStoryboardHelper(name)
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: self.storyboardIdentifier) as! T
        return controller
    }
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    func goBack() {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
