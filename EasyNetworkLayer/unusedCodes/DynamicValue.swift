//
//  SourceDataSource.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

//typealias CompletionHandler = (() -> Void)
//class DynamicValue<T> {
//    
//    var value : T {
//        didSet {
//            self.notify()
//        }
//    }
//    
//    private var observers = [String: CompletionHandler]()
//    
//    init(_ value: T) {
//        self.value = value
//    }
//    
//    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
//        observers[observer.description] = completionHandler
//    }
//    
//    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
//        self.addObserver(observer, completionHandler: completionHandler)
//        self.notify()
//    }
//    
//    private func notify() {
//        observers.forEach({ $0.value() })
//    }
//    
//    deinit {
//        observers.removeAll()
//    }
//}
//
//
//
