//
//  BBCheckMarkCell.swift
//  Workout Generator
//
//  Created by Yash Hindka on 7/8/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit

class BBCheckMarkCell: UITableViewCell {

    @IBOutlet weak var BBexerciseLabel: UILabel!
    
    @IBOutlet weak var BBcheckButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
