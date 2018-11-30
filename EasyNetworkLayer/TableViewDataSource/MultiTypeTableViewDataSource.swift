//
//  MultiTypeTableDataSource.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 30.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

public protocol BaseEntity {
    var identifier: String { get }
}
extension BaseEntity {
    
}

struct A: BaseEntity {
    var title: String
    var identifier: String = String(describing: TitleViewCell.self)
    init(title: String) {
        self.title = title
    }
}

struct B: BaseEntity {
    var identifier: String = String(describing: SubtitleViewCell.self)
}
struct C: BaseEntity {
    var identifier: String = String(describing: ImageViewCell.self)
}

open class BaseMultiCell<D: BaseEntity>: UITableViewCell, CellProtocol {
    open func config(_ data: D?) {}
}

class TitleViewCell: BaseMultiCell<A> {
    override func config(_ data: A?) {
        // yanlızca aa geldi
    }
}

class SubtitleViewCell: BaseMultiCell<B> {
    override func config(_ data: B?) {
        // yalnızca b geldi
    }
}

class ImageViewCell: BaseMultiCell<C> {
    override func config(_ data: C?) {
        // yalnıca c geldi
    }
}

class MultiTypeDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    var dataSet = [BaseEntity]()
    
    override init() {
        let a = A(title: "bla bla")
        dataSet = [a, B(), C()]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.dataSet[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: item.identifier, for: indexPath)
        
        bindCellAndData(cell, item)
        return cell
    }
    
    
    open func bindCellAndData(_ cell: UITableViewCell, _ item: BaseEntity?) {
        if let titleCell = cell as? TitleViewCell {
            titleCell.config(item as? A)
        } else if let subTitleCell = cell as? SubtitleViewCell {
            subTitleCell.config(item as? B)
        }
    }
}

