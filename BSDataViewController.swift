//
//  BSDataViewController.swift
//  Workout Generator
//
//  Created by Yash Hindka on 7/8/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit
import GoogleMobileAds

class BSDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    
    @IBOutlet weak var BSTable: UITableView!
    
    @IBOutlet weak var exerciseImage: UIImageView!
    
    @IBOutlet weak var adBanner: GADBannerView!
    
    
    //number exercises in beginner workout
    let a: Int = 4
    var i: Int = 0
    let beginnerShoulder = ["Lateral Delt Raise", "Front Delt Raise", "Rear Delt Raise"]
    let beginnerShoulder2 = ["Barbell Overhead Press", "Dumbell Overhead Press"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let BScell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! CheckMarkCell
        BScell.selectionStyle = .none
        BScell.checkButton.addTarget(self, action: #selector(checkMarkPressed(sender:)), for: .touchUpInside)
        
        if(indexPath.row < 1)
        {
            let index = Int.random(in: 0...1)
            BScell.exerciseLabel.text = beginnerShoulder2[index]
            if (BScell.exerciseLabel.text == "Barbell Overhead Press")
            {
                BScell.exerciseLabel.text = "Barbell Overhead Press - \(generateRandomNumber()) sets of 5 reps"
                exerciseImage?.image = UIImage(named: "Barbell Overhead Press")
            }
            else
            {
                BScell.exerciseLabel.text = "Dumbell Overhead Press - \(generateRandomNumber()) sets of 5-8 reps"
                exerciseImage?.image = UIImage(named: "Dumbell Overhead Press")
            }
        }
            
        else
        {
            BScell.exerciseLabel.text = beginnerShoulder[indexPath.row - 1] + " - \(generateRandomNumber()) sets of 8-12 reps"
            
        }
        return BScell
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
        BSTable?.register(UINib.init(nibName: "CheckMarkCell", bundle: nil), forCellReuseIdentifier: "CheckListIdentifier")
        
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
        guard let cell = sender.superview?.superview as? CheckMarkCell else {
            return
        }
        
        var indexPath = BSTable?.indexPath(for: cell)
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
            let cell1 = BSTable?.cellForRow(at: indexPath!) as! CheckMarkCell
            if (!(cell1.checkButton.isSelected))
            {
                row = indexPath!.row
                print(row)
                if(row == 0 && cell1.exerciseLabel.text?.prefix(7) == "Barbell")
                {
                    exerciseImage?.image = UIImage(named: "Barbell Overhead Press")
                }
                else if (row == 0 && cell1.exerciseLabel.text?.prefix(7) == "Dumbell")
                {
                    print(true)
                    exerciseImage?.image = UIImage(named: "Dumbell Overhead Press")
                }
                    
                else
                {
                    exerciseImage?.image = UIImage(named: "BS\(generateNextImage(d: row))")
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



