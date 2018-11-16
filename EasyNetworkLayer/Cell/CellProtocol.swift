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
    static var identifier: String { get }
    static var nibName: String { get }

    func config(_ data: Any?)
}

extension CellProtocol {
	// make those public so you can override BaseCell
	public static var identifier: String {
        return String(describing: self) + "Identifier"
    }
    
	public static var nibName: String {
        return String(describing: self)
    }
}

open class BaseCell: UITableViewCell, CellProtocol {
    open func config(_ data: Any?) {
        
    }
}

extension UITableView {
    
    func registerReusableCell<T: BaseCell>(_: T.Type) {
//        register(T.self, forCellReuseIdentifier: T.identifier)
        register(UINib(nibName: T.nibName, bundle: nil), forCellReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: BaseCell>(indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}





