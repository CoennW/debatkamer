//
//  NewsTableViewCell.swift
//  debatkamer
//
//  Created by Fhict on 08/06/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
