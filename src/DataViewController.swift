//
//  DataViewController.swift
//  Workout Generator
//
//  Created by Dinesh Hindka on 7/3/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit


class WelcomeScreenController: UIViewController
    
{
    
    @IBOutlet weak var slider: CustomSlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.setThumbImage(UIImage(named: "ThumbArm"), for: UIControl.State.normal)
        slider.addTarget(self, action: #selector(doSegue(sender:)), for: .touchDragInside)
    }
    
    @IBAction func doSegue(sender: UISlider)
    {
        
        if(sender.value == 1)
        {
            
            performSegue(withIdentifier: "Show", sender: slider)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.dataLabel!.text = dataObject
        
    }
    
    
}

