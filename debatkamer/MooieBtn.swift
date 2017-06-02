//
//  MooieBtn.swift
//  debatkamer
//
//  Created by Ruud Slagers on 02/06/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit

class MooieBtn: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Schaduw onder de view
        layer.shadowColor = UIColor(red: SHADOW_GRAY , green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = 5.0
    }
    
}
