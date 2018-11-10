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
    
	class func instantiateFromStoryboard(_ storyboradName: String? = nil) -> Self { // name was ambigous name of waht controller or strory board :D
        return instantiateFromStoryboardHelper(storyboradName)
    }
    
	fileprivate class func instantiateFromStoryboardHelper<T>(_ storyboardName: String?) -> T where T: UIViewController {
		let storyboard: UIStoryboard
		if let storyboardName = storyboardName {
			storyboard = UIStoryboard.forName(storyboardName)
		} else {
			storyboard = UIStoryboard.forName()
		}
		if let controller = storyboard.instantiateViewController(withIdentifier: self.storyboardIdentifier) as? T {
			return controller
		}
		fatalError("\(self.storyboardIdentifier) can not be found in storyborad, for \(T.self) controller") // provide message if it fails
	}
    
   // static var storyboardIdentifier: String {
   //     return String(describing: self)
   // }
	
	static var storyboardIdentifier: String {
		return "\(String(describing: self).lowercased)Identifier" // will provide camel cased identifier :D
	}
    
    func goBack() { // why not call it 'popSelf'
        _ = self.navigationController?.popViewController(animated: true)
    }
}
