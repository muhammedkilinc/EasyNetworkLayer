//
//  SourceTableViewCell.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import UIKit

class SourceTableViewCell: BaseCell, CellProtocol {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var langLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func config(_ data: Source?) {
        if let item = data {
            titleLabel?.text = item.name
            descLabel?.text = item.description
            langLabel?.text = item.language
        }
    }
    
}
