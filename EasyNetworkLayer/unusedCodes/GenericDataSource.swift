//
//  GenericDataSource.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 16.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

//class GenericDataSource: NSObject, UITableViewDataSource {
//    var data: DynamicValue<[Any]> = DynamicValue([])
//    var cellType: CellProtocol.Type!
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
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath)
//        
//        let item = self.data.value[indexPath.row]
//        if let cell = cell as? CellProtocol {
//            cell.config(item)
//        }
//        return cell
//    }
//}
