//
//  UITableView+Utils.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 30.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerReusableCell<T: BaseCell>(type: T.Type) {
        //        register(T.self, forCellReuseIdentifier: T.identifier)
        print("nib: \(String(describing: type)) identifier: \(String(describing: type))Identifier")
        register(UINib(nibName: String(describing: type), bundle: nil), forCellReuseIdentifier: "\(String(describing: type))Identifier")
    }
    
    func registerReusableCell<T: CellProtocol>(type: T.Type) {
        //        register(T.self, forCellReuseIdentifier: T.identifier)
        print("nib: \(String(describing: type)) identifier: \(String(describing: type))Identifier")
        register(UINib(nibName: String(describing: type), bundle: nil), forCellReuseIdentifier: "\(String(describing: type))Identifier")
    }
    
    func dequeueReusableCell<T: CellProtocol>(type: T.Type, indexPath: IndexPath) -> T {
        print("dequeu identifier: \(String(describing: T.self))Identifier")
        return dequeueReusableCell(withIdentifier: "\(String(describing: type))Identifier", for: indexPath) as! T
    }
    
    func dequeueReusableCell<T: BaseCell>(type: T.Type, indexPath: IndexPath) -> T {
        print("dequeu identifier: \(String(describing: T.self))Identifier")
        return dequeueReusableCell(withIdentifier: "\(String(describing: type))Identifier", for: indexPath) as! T
    }
}
