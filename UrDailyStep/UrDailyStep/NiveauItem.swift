//
//  NiveauItem.swift
//  UrDailyStep
//
//  Created by Flavian Mary on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit

class NiveauItem: UITableViewCell {
    
    @IBOutlet weak var label_level: UILabel!
    
    @IBOutlet weak var label_repetition: UILabel!
    var index:IndexPath = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
}
