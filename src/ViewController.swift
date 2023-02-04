//
//  File.swift
//  Workout Generator
//
//  Created by Yash Hindka on 7/3/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit
import GoogleMobileAds

var level: Int = 0;

class ViewController: UIViewController {
    
    
    @IBOutlet weak var adBanner: GADBannerView!
    
    @IBOutlet weak var beginnerButton: UIButton!
    
    @IBOutlet weak var intermediateButton: UIButton!
    
    @IBOutlet weak var advancedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        adBanner.adUnitID = "ca-app-pub-3186669794523908/4897251690"
        adBanner.rootViewController = self
        adBanner.load(GADRequest())
        level = 0
        beginnerButton.addTarget(self, action: #selector(beginnerPressed(_:)), for: .touchUpInside)
        intermediateButton.addTarget(self, action: #selector(intermediatePressed(_:)), for: .touchUpInside)
        advancedButton.addTarget(self, action: #selector(advancedPressed(_:)), for: .touchUpInside)
    }
    
    
   @objc func beginnerPressed(_ sender: UIButton)
    {
        level = 1
    }
    
    @objc func intermediatePressed(_ sender: UIButton)
    {
        level = 2
    }
    
    @objc func advancedPressed(_ sender: UIButton)
    {
        level = 3
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
}
