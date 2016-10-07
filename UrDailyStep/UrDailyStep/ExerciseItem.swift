//
//  ExerciseItem.swift
//  UrDailyStep
//
//  Created by Flavian Mary on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit

class ExerciseItem: UITableViewCell {
    
    
    @IBOutlet weak var picture: UIImageView!

    @IBOutlet weak var label: UILabel!
    
    
    var index:IndexPath = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
