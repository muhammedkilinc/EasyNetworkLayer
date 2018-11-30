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
    associatedtype Model
    func config(_ data: Model?)
}

public protocol CellDelegateProtocol: class {
    var delegate: CellDelegate? { get set }
}

open class BaseCell: UITableViewCell {
    public func config(_ data: Any?) {}
}



