//
//  IBDataViewController.swift
//  Workout Generator
//
//  Created by Yash Hindka on 7/16/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit
import GoogleMobileAds

class IBDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate

{
    //number exercises in intermediate workout
    let a:Int = 6;
    
    let intermediateBack = ["Deadlift", "Barbell Rows", "Cable Rows", "Biceps Curls"]
    let intermediateBack3 = ["Hammer Curls", "Preacher Curls"]
    let intermediateBack2 = ["Lat Pulldowns", "Standing Lat Pulldowns"]
    
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
        i = Int.random(in: 3...4)
        return String(i)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! CheckMarkCell
        cell.selectionStyle = .none
        cell.checkButton.addTarget(self, action: #selector(checkMarkPressed(sender: )), for: .touchUpInside)
         cell.checkButton.isSelected = tableBools[indexPath.row]
        
        if (indexPath.row < 1)
        {
            cell.exerciseLabel.text = intermediateBack[indexPath.row] + " - \(generateRandomNumber()) sets of 3-5 reps"
        }
        else if(indexPath.row == 1){
            cell.exerciseLabel.text = intermediateBack[1] + " - \(generateRandomNumber()) sets of 8-12 reps"
        }
        else if(indexPath.row == 3)
        {
            let index = Int.random(in: 0...1)
            cell.exerciseLabel.text = intermediateBack2[index]
            if (cell.exerciseLabel.text == "Lat Pulldowns")
            {
                cell.exerciseLabel.text = "Lat Pulldowns - \(generateRandomNumber()) sets of 8-12 reps"
            }
                
            else
            {
                cell.exerciseLabel.text = "Standing Lat Pulldowns - \(generateRandomNumber()) sets of 8-12 reps"
            }
        }
        else if (indexPath.row == 4)
        {
            cell.exerciseLabel.text = intermediateBack[indexPath.row - 1] + " - \(generateRandomNumber()) sets of 8-12 reps"
        }
        else if(indexPath.row == 5)
        {
            let index = Int.random(in: 0...1)
            cell.exerciseLabel.text = intermediateBack3[index]
            if (cell.exerciseLabel.text == "Hammer Curls")
            {
                cell.exerciseLabel.text = "Hammer Curls - \(generateRandomNumber()) sets of 8-12 reps"
            }
            else
            {
                cell.exerciseLabel.text = "Preacher Curls - \(generateRandomNumber()) sets of 8-12 reps"
            }
                
        }
            
        else
        {
            cell.exerciseLabel.text = intermediateBack[indexPath.row] + " - \(generateRandomNumber()) sets of 8-12 reps"
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
            return // or fatalError() or whatever
        }
        
        var indexPath = exerciseTable?.indexPath(for: cell)
        var row = (indexPath?.row ?? 0) + 1
        
        
        
        
        
        if (sender.isSelected)
        {
            tableBools[row - 1] = false
            sender.isSelected = false;
            
        }
        else
        {
            tableBools[row-1] = true
            sender.isSelected = true;
            
            
        }
        
        for n in 0...5
        {
            indexPath = IndexPath(row: n, section: 0)
            if(exerciseTable?.cellForRow(at: indexPath!) != nil)
            {
            let cell1 = exerciseTable?.cellForRow(at: indexPath!) as! CheckMarkCell
                if (!(cell1.checkButton.isSelected))
                {
                    row = indexPath!.row
                    if (row == 3 && cell1.exerciseLabel.text?.prefix(3) == "Lat")
                    {
                        exerciseImage?.image = UIImage(named: "Lat Pulldowns")
                    }
                    
                    else if (row == 3 && cell1.exerciseLabel.text?.prefix(8) == "Standing")
                    {
                        exerciseImage?.image = UIImage(named: "Standing Lat Pulldowns")
                    }
                    else if (row == 5 && cell1.exerciseLabel.text?.prefix(6) == "Hammer")
                    {
                        exerciseImage?.image = UIImage(named: "Hammer Curls")
                    }
                    else if (row == 5 && cell1.exerciseLabel.text?.prefix(8) == "Preacher")
                    {
                        exerciseImage?.image = UIImage(named: "Preacher Curls")
                    }
                    else
                    {
                        exerciseImage?.image = UIImage(named: "IB\(generateNextImage(d: row))")
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
