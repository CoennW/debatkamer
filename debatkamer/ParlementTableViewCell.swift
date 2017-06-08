//
//  ParlementTableViewCell.swift
//  debatkamer
//
//  Created by Fhict on 02/06/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit

class ParlementTableViewCell: UITableViewCell {

    @IBOutlet weak var zetelLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var voteLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
