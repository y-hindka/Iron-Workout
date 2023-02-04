//
//  CustomSlider.swift
//  Workout Generator
//
//  Created by Yash Hindka on 8/7/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit

class CustomSlider: UISlider
{
    
    
    @IBOutlet weak var rectangle: UIImageView!
    
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect
    {
        var width: CGFloat = 0
        if (rectangle != nil)
        {
            width = rectangle.frame.width - 110
        }
        
        return CGRect(x: 0, y: 0, width: width,height: 30)
        
    }
    
    

    
    
    
    
    

}
