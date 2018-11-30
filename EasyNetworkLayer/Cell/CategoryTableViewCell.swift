//
//  CategoryTableViewCell.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 29.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import UIKit

protocol CategoryTableCellDelegate: class {
    func valueChangedCategoryStatus(isActive: Bool)
}

class CategoryTableViewCell: BaseCell, CellDelegateProtocol, CellProtocol {
    var delegate: CellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activeSwitch: UISwitch!

//    weak var delegate: CategoryTableCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func valueChangedSwitch(_ sender: Any) {
        if let delegate = delegate as? CategoryTableCellDelegate {
            delegate.valueChangedCategoryStatus(isActive: activeSwitch.isOn)
        }
    }
    
    func config(_ data: NewsCategory?) {
        if let item = data {
            titleLabel.text = item.rawValue
        }
    }
    
}
