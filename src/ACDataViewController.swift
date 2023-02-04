//
//  ACDataViewController.swift
//  Workout Generator
//
//  Created by Yash Hindka on 7/17/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ACDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

{
    //number exercises in advanced workout
    let a:Int = 8;
    
    let advancedChest = ["Flat Bench Press", "Incline Bench Press", "Dumbell Incline Bench Press", "Dips", "Rope Pushdown", "EZ-Bar Pushdown"]
    let advancedChest2 = ["Cable Fly", "Decline Bench Press"]
    let advancedChest3 = ["Overhead Extension", "Lying Triceps Extension"]
    
    var tableBools = [false, false, false, false, false, false, false, false]
    
    var i:Int = 0
    
    var x:Int = 1;
    
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

        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! CheckMarkCell
        cell.selectionStyle = .none
        cell.checkButton.addTarget(self, action: #selector(checkMarkPressed(sender: )), for: .touchUpInside)
        cell.checkButton.isSelected = tableBools[indexPath.row]
        
        if(indexPath.row < 2)
        {
            cell.exerciseLabel.text = advancedChest[indexPath.row] + " - \(generateRandomNumber()) sets of 3-5 reps"
        }
            
        else if(indexPath.row == 2)
        {
            cell.exerciseLabel.text = advancedChest[indexPath.row] + " - \(generateRandomNumber()) sets of 5-8 reps"
        }
            
        else if(indexPath.row == 3)
        {
            let index = Int.random(in: 0...1)
            cell.exerciseLabel.text = advancedChest2[index]
            if (cell.exerciseLabel.text == "Cable Fly")
            {
                cell.exerciseLabel.text = "Cable Fly - \(generateRandomNumber()) sets of 10-15 reps"
            }
                
            else
            {
                cell.exerciseLabel.text = "Decline Bench Press - \(generateRandomNumber()) sets of 6-8 reps"
            }
        }
            
        else if(indexPath.row == 4 || indexPath.row == 5)
        {
             cell.exerciseLabel.text = advancedChest[indexPath.row - 1] + " - \(generateRandomNumber()) sets of 8-12 reps"
        }
            
        else if(indexPath.row == 6)
        {
            let index = Int.random(in: 0...1)
            cell.exerciseLabel.text = advancedChest3[index]
            if (cell.exerciseLabel.text == "Overhead Extension")
            {
                cell.exerciseLabel.text = "Overhead Extension - \(generateRandomNumber()) sets of 10-12 reps"
            }
                
            else
            {
                cell.exerciseLabel.text = "Lying Triceps Extension - \(generateRandomNumber()) sets of 8-12 reps"
            }
        }
            
        else
        {
            cell.exerciseLabel.text = advancedChest[indexPath.row - 2] + " - \(generateRandomNumber()) sets of 8-12 reps"
        }
        
        return cell
    }
    
    func generateNextImage(d:Int) -> Int
    {
        return d+1
    }
    
    
    
    @objc func checkMarkPressed(sender: UIButton)
    {
        guard var cell = sender.superview?.superview as? CheckMarkCell else {
            return // or fatalError() or whatever
        }
        
        var indexPath = exerciseTable?.indexPath(for: cell)
        var row = (indexPath?.row ?? 0) + 1
        
        print(row)
        
        
        if (sender.isSelected)
        {
            tableBools[row - 1] = false
            sender.isSelected = false
            
        }
        else
        {
            tableBools[row - 1] = true
            sender.isSelected = true
            
            
        }
        
        
        for n in 0...7
        {
            indexPath = IndexPath(row: n, section: 0)
            if(exerciseTable?.cellForRow(at: indexPath!) != nil)
            {
                cell = exerciseTable?.cellForRow(at: indexPath!) as! CheckMarkCell
                if (!(cell.checkButton.isSelected))
                {
                    row = indexPath!.row
                    if(row == 0 && cell.exerciseLabel.text?.prefix(4) == "Flat")
                    {
                        exerciseImage?.image = UIImage(named: "BC1")
                    }
                    if (row == 3 && cell.exerciseLabel.text?.prefix(7) == "Decline")
                    {
                        exerciseImage?.image = UIImage(named: "Decline Bench Press")
                    }
                    
                    else if (row == 3 && cell.exerciseLabel.text?.prefix(5) == "Cable")
                    {
                        exerciseImage?.image = UIImage(named: "Cable Flyes")
                    }
                    
                    else if(row == 6 && cell.exerciseLabel.text?.prefix(8) == "Overhead"){
                        exerciseImage?.image = UIImage(named: "Overhead Extension")
                    }
                    
                    else if(row == 6 && cell.exerciseLabel.text?.prefix(5) == "Lying"){
                        exerciseImage?.image = UIImage(named: "Lying Triceps Extension")
                    }
                    else {
                        exerciseImage?.image = UIImage(named: "AC\(generateNextImage(d: row))")
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


