//
//  CellProtocol.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

public protocol CellProtocol: class {
    func config(_ data: Any?)
}


open class BaseCell: UITableViewCell, CellProtocol {
    public func config(_ data: Any?) {
        
    }
}

extension UITableView {
    
    func registerReusableCell<T: BaseCell>(type: T.Type) {
        //        register(T.self, forCellReuseIdentifier: T.identifier)
        print("nib: \(String(describing: type)) identifier: \(String(describing: type))Identifier")
        register(UINib(nibName: String(describing: type), bundle: nil), forCellReuseIdentifier: "\(String(describing: type))Identifier")
    }
    
    func dequeueReusableCell<T: BaseCell>(type: T.Type, indexPath: IndexPath) -> T {
        print("dequeu identifier: \(String(describing: T.self))Identifier")
        return dequeueReusableCell(withIdentifier: "\(String(describing: type))Identifier", for: indexPath) as! T
    }
}





