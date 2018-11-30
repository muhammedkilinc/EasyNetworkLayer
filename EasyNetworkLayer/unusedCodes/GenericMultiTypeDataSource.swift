//
//  GenericMultiTypeDataSource.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 16.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

//typealias CellTypeData = (data: Any, type: CellProtocol.Type)
//
//class GenericMultiTypeDataSource: NSObject, UITableDataSource {
//    var data: DynamicValue<[CellTypeData]> = DynamicValue([])
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.value.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = self.data.value[indexPath.row]
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: item.type.identifier, for: indexPath)
//        
//        if let cell = cell as? CellProtocol {
//            cell.config(item.data)
//        }
//        return cell
//    }
//}
