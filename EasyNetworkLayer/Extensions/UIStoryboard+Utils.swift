//
//  UIStoryboard+Utils.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func main() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
	
	/// init storyborad by name default name is 'Main' if empty
	public static func forName(_ name: String = "Main") -> UIStoryboard {
		return UIStoryboard(name: name, bundle: Bundle.main)
	}
}


