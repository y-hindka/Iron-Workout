//
//  ALDataViewController.swift
//  Workout Generator
//
//  Created by Yash Hindka on 7/19/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ALDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate

{
    //number exercises in advanced workout
    let a:Int = 7;
    
    var jInt = 0
    
    let advancedLegs = ["Barbell Front Squat", "Bulgarian Split Squat (Each Leg)", "Walking Lunges (Each Leg)", "Sissy Squats", "Romanian Deadlifts", "Leg Curls"]
    let advancedLegs2 = ["Barbell Back Squat", "Leg Press"]
    
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
        var j:String = ""
        
        if(indexPath.row < 1)
        {
            cell.exerciseLabel.text = advancedLegs[indexPath.row] + " - \(generateRandomNumber()) sets of 3-5 reps"
        }
            
        else if(indexPath.row == 1)
        {
            let index = Int.random(in: 0...1)
            cell.exerciseLabel.text = advancedLegs2[index]
            if (cell.exerciseLabel.text == "Barbell Back Squat")
            {
                cell.exerciseLabel.text = "Barbell Back Squat - \(generateRandomNumber()) sets of 10-15 reps"
            }
                
            else
            {
                cell.exerciseLabel.text = "Leg Press - \(generateRandomNumber()) sets of 25 reps"
            }
        }
        
        else if(indexPath.row == 6)
        {
            
            cell.exerciseLabel.text = "Leg Curls - " + (String)(9-jInt) + " sets of 8-12 reps"
        }
            
        else
        {
            j = generateRandomNumber()
            jInt = Int(j) ?? 0
            cell.exerciseLabel.text = advancedLegs[indexPath.row - 1] + " - " + j + " sets of 8-12 reps"
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
        
        for n in 0...6
        {
            indexPath = IndexPath(row: n, section: 0)
            if(exerciseTable?.cellForRow(at: indexPath!) != nil)
            {
                let cell1 = exerciseTable?.cellForRow(at: indexPath!) as! CheckMarkCell
                if (!(cell1.checkButton.isSelected))
                {
                    row = indexPath!.row
                    if (row == 1 && cell1.exerciseLabel.text?.prefix(7) == "Barbell")
                    {
                        exerciseImage?.image = UIImage(named: "Barbell Back Squat")
                    }
                    else if (row == 1 && cell1.exerciseLabel.text?.prefix(3) == "Leg")
                    {
                        exerciseImage?.image = UIImage(named: "Leg Press")
                    }
                    else
                    {
                        exerciseImage?.image = UIImage(named: "AL\(generateNextImage(d: row))")
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



