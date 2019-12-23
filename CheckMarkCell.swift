//
//  CheckMarkCell.swift
//  Workout Generator
//
//  Created by Yash Hindka on 7/4/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit

class CheckMarkCell: UITableViewCell {

    @IBOutlet weak var exerciseLabel: UILabel!
    
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
