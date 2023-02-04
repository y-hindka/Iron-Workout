//
//  DataViewController.swift
//  Workout Generator
//
//  Created by Yash Hindka on 7/3/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit


class DataViewController: UIViewController
    
{
    
    @IBOutlet weak var slider: CustomSlider!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var beginButton: UIButton!
    
    @IBOutlet weak var supportButton: UIButton!
    
    
    var dataObject: String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*print((rectangle.frame.width - 200)/2)
        
        let leadingSpace = NSLayoutConstraint(item: slider, attribute: .leading, relatedBy: .equal, toItem: rectangle, attribute: .leading, multiplier: 1, constant: (rectangle.frame.width - 200))
        
        NSLayoutConstraint.activate([leadingSpace])*/
        
        
        slider.setThumbImage(UIImage(named: "ThumbArm"), for: UIControl.State.normal)
        slider.addTarget(self, action: #selector(doSegue(sender:)), for: .touchDragInside)
        
    }
    
    @IBAction func doSegue(sender: UISlider)
    {
        
        if(sender.value == 1)
        {
            slider.minimumTrackTintColor = UIColor.green
            performSegue(withIdentifier: "Show", sender: slider)
        }
    }
    
    
    @IBAction func supportPressed(_ sender: UIButton)
    {
        if let url = URL(string: "https://ironworkout.wixsite.com/support")
        {
            UIApplication.shared.canOpenURL(url)
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                // Fallback on earlier versions
            }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
        
    }
    
    
}




