//
//  CellProtocol.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation

public protocol CellProtocol: class {
    static func identifier() -> String
    static func nibName() -> String

    func config(_ data: Any?)
}

extension CellProtocol {
    static func identifier() -> String {
        return String(describing: self) + "identifier"
    }
    
    static func nibName() -> String {
        return String(describing: self)
    }
}
