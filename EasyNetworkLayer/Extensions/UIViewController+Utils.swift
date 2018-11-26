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
    
	class func instantiateFromStoryboard(name: String? = nil) -> Self { // name was ambigous name of waht controller or strory board :D
        return instantiateFromStoryboardHelper(name)
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T: UIViewController>(_ name: String?) -> T {
		let storyboard: UIStoryboard
		if let storyboardName = name {
			storyboard = UIStoryboard.forName(storyboardName)
		} else {
			storyboard = UIStoryboard.forName()
		}
		if let controller = storyboard.instantiateViewController(withIdentifier: self.storyboardIdentifier) as? T {
			return controller
		}
		fatalError("\(self.storyboardIdentifier) can not be found in storyborad, for \(T.self) controller") // provide message if it fails
	}
    
	static var storyboardIdentifier: String {
		return "\(String(describing: self))Identifier"
	}
    
    func popSelf(animated: Bool = true) { // why not call it 'popSelf'
        _ = self.navigationController?.popViewController(animated: animated)
    }
}
