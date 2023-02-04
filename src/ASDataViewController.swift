//
//  ASDataViewController.swift
//  Workout Generator
//
//  Created by Yash Hindka on 7/19/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ASDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate

{
    //number exercises in advanced shoulders workout
    let a:Int = 5;
    
    let advancedShoulders = ["Lateral Delt Raise", "Rear Delt Raise", "Dumbell Shrugs"]
    let advancedShoulders2 = ["Barbell Overhead Press", "Dumbell Overhead Press"]
    let advancedShoulders3 = ["Front Delt Raise", "Front Plate Raise"]
    
    var i:Int = 0
    
    var x:Int = 1;
    
    var tableBools = [false, false, false, false, false, false, false, false]
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var exerciseTable: UITableView?
    
    @IBOutlet weak var exerciseImage: UIImageView?
    
    @IBOutlet weak var adBanner: GADBannerView!
    
    
    var dataObject: String = ""
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a;
    }
    func generateRandomNumber() -> String
    {
        i = Int.random(in: 3...5)
        return String(i)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! CheckMarkCell
        cell.selectionStyle = .none
        cell.checkButton.addTarget(self, action: #selector(checkMarkPressed(sender: )), for: .touchUpInside)
         cell.checkButton.isSelected = tableBools[indexPath.row]
        
        if(indexPath.row < 1)
        {
            let index = Int.random(in: 0...1)
            cell.exerciseLabel.text = advancedShoulders2[index]
            if (cell.exerciseLabel.text == "Barbell Overhead Press")
            {
                cell.exerciseLabel.text = "Barbell Overhead Press - \(generateRandomNumber()) sets of 3-5 reps"
                exerciseImage?.image = UIImage(named: "Barbell Overhead Press")
            }
                
            else
            {
                cell.exerciseLabel.text = "Dumbell Overhead Press - \(generateRandomNumber()) sets of 4-6 reps"
                exerciseImage?.image = UIImage(named: "Dumbell Overhead Press")
            }
        }
        else if(indexPath.row == 1)
        {
            let index = Int.random(in: 0...1)
            cell.exerciseLabel.text = advancedShoulders3[index]
            if (cell.exerciseLabel.text == "Front Delt Raise")
            {
                cell.exerciseLabel.text = "Front Delt Raise - \(generateRandomNumber()) sets of 8-12 reps"
            }
                
            else
            {
                cell.exerciseLabel.text = "Front Plate Raise - \(generateRandomNumber()) sets of 8-12 reps"
            }
        }
            
            
        else
        {
            cell.exerciseLabel.text = advancedShoulders[indexPath.row - 2] + " - \(generateRandomNumber()) sets of 8-12 reps"
        }
        
        
        return cell
    }
    
    func generateNextImage(d:Int) -> Int
    {
        return d+1
    }
    
    
    
    @objc func checkMarkPressed(sender: UIButton)
    {
        guard let cell = sender.superview?.superview as? CheckMarkCell else {
            return 
        }
        
        var indexPath = exerciseTable?.indexPath(for: cell)
        var row = (indexPath?.row ?? 0) + 1
        
        
        

        
        if (sender.isSelected)
        {
            tableBools[row-1] = false
            sender.isSelected = false;
            
        }
        else
        {
            tableBools[row-1] = true
            sender.isSelected = true;
            
            
        }
        
        for n in 0...4
        {
            indexPath = IndexPath(row: n, section: 0)
            if(exerciseTable?.cellForRow(at: indexPath!) != nil)
            {
                let cell1 = exerciseTable?.cellForRow(at: indexPath!) as! CheckMarkCell
                if (!(cell1.checkButton.isSelected))
                {
                    row = indexPath!.row
                    if (row == 0 && cell1.exerciseLabel.text?.prefix(7) == "Barbell")
                    {
                        exerciseImage?.image = UIImage(named: "Barbell Overhead Press")
                    }
                    else if (row == 0 && cell1.exerciseLabel.text?.prefix(7) == "Dumbell")
                    {
                        exerciseImage?.image = UIImage(named: "Dumbell Overhead Press")
                    }
                    else if (row == 1 && cell1.exerciseLabel.text?.prefix(10) == "Front Delt")
                    {
                        exerciseImage?.image = UIImage(named: "Front Delt Raise")
                    }
                    else if (row == 1 && cell1.exerciseLabel.text?.prefix(11) == "Front Plate")
                    {
                        exerciseImage?.image = UIImage(named: "Front Plate Raise")
                    }
                    else
                    {
                    exerciseImage?.image = UIImage(named: "AS\(generateNextImage(d: row))")
                    }
                    break
                }
            }
            
        }
        
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
        exerciseTable?.register(UINib.init(nibName: "CheckMarkCell", bundle: nil), forCellReuseIdentifier: "CheckListIdentifier")
        
        
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.dataLabel!.text = dataObject
        
    }
    
    
    
    
}

