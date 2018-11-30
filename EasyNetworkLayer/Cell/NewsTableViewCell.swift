//
//  NewsTableViewCell.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import UIKit

class NewsTableViewCell: BaseCell, CellProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func config(_ data: Article?) {
        if let item = data {
            titleLabel?.text = item.title
            descLabel?.text = item.description
            sourceLabel?.text = item.source?.name
            contentLabel?.text = item.content
            dateLabel?.text = item.publishedAt

            imgView?.loadImageUsingCache(url: item.urlToImage, placeHolder: nil, completion: { (success) in

            })

        }
    }
    
}
