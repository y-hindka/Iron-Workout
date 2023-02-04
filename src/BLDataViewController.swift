//
//  BLDataViewController.swift
//  Workout Generator
//
//  Created by Yash Hindka on 7/9/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit
import GoogleMobileAds

class BLDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var BLTable: UITableView!
    
    
    @IBOutlet weak var exerciseImage: UIImageView!
    
    @IBOutlet weak var adBanner: GADBannerView!
    
    
    let a: Int = 4
    var i: Int = 0
    let beginnerLegs = ["Barbell Back Squat", "Bulgarian Split Squat (Each Leg)", "Barbell Lunges (Each Leg)"]
    let beginnerLegs2 = ["Leg Curls", "Romanian Deadlifts"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let BLcell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! CheckMarkCell
        BLcell.selectionStyle = .none
        BLcell.checkButton.addTarget(self, action: #selector(checkMarkPressed(sender:)), for: .touchUpInside)
        
        if(indexPath.row == 0)
        {
            print(true)
            BLcell.exerciseLabel.text = beginnerLegs[0] + " -  \(generateRandomNumber()) sets of 6-8 reps"
        }
        else if(indexPath.row == 3)
        {
            let index = Int.random(in: 0...1)
            BLcell.exerciseLabel.text = beginnerLegs2[index]
            if (BLcell.exerciseLabel.text == "Leg Curls")
            {
                BLcell.exerciseLabel.text = "Leg Curls - \(generateRandomNumber()) sets of 8-12 reps"
            }
            else
            {
                BLcell.exerciseLabel.text = "Romanian Deadlifts - \(generateRandomNumber()) sets of 8-12 reps"
            }
        }
            
        else
        {
            BLcell.exerciseLabel.text = beginnerLegs[indexPath.row] + " - \(generateRandomNumber()) sets of 8-12 reps"
            
        }
        return BLcell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        adBanner.adUnitID = "ca-app-pub-3186669794523908/4897251690"
        adBanner.rootViewController = self
        adBanner.load(GADRequest())
        BLTable?.register(UINib.init(nibName: "CheckMarkCell", bundle: nil), forCellReuseIdentifier: "CheckListIdentifier")
        
    }
    
    func generateNextImage(d: Int) -> Int
    {
        return d+1
    }
    
    func generateRandomNumber() -> String
    {
        i = Int.random(in: 2...3)
        return String(i)
    }
    
    @objc func checkMarkPressed(sender: UIButton)
    {
        guard let cell = sender.superview?.superview as? CheckMarkCell
        else
        {
            return
        }
        
        var indexPath = BLTable?.indexPath(for: cell)
        var row = (indexPath?.row ?? 0) + 1
        
        
        
        
        
        if (sender.isSelected)
        {
            sender.isSelected = false;
            
            
        }
        else
        {
            sender.isSelected = true;
            
            
        }
        
        for n in 0...3
        {
            indexPath = IndexPath(row: n, section: 0)
            let cell1 = BLTable?.cellForRow(at: indexPath!) as! CheckMarkCell
            if (!(cell1.checkButton.isSelected))
            {
                row = indexPath!.row
                if(row == 3 && cell1.exerciseLabel.text?.prefix(3) == "Leg")
                {
                    exerciseImage?.image = UIImage(named: "Leg Curls")
                }
                else if (row == 3 && cell1.exerciseLabel.text?.prefix(8) == "Romanian")
                {
                    exerciseImage?.image = UIImage(named: "Romanian Deadlifts")
                }
                    
                else
                {
                    exerciseImage?.image = UIImage(named: "BL\(generateNextImage(d: row))")
                }
                break
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.dataLabel!.text = dataObject
        
    }
    
    
    
    
}
