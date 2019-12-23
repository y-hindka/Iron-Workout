//
//  BBDataViewController.swift
//  Workout Generator
//
//  Created by Yash Hindka on 7/8/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit
import GoogleMobileAds

class BBDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    //number exercises in beginner workout
    let a: Int = 4
    var i: Int = 0
    let beginnerBack = ["Deadlift", "Lat Pulldowns", "Biceps Curls"]
    let beginnerBack2 = ["Cable Rows", "Barbell Rows"]
    
    
    @IBOutlet weak var BBTable: UITableView!
    
    @IBOutlet weak var exerciseImage: UIImageView?
    
    
    @IBOutlet weak var adBanner: GADBannerView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! CheckMarkCell
            cell.selectionStyle = .none
            cell.checkButton.addTarget(self, action: #selector(checkMarkPressed(sender:)), for: .touchUpInside)
            
            if(indexPath.row < 1)
            {
                cell.exerciseLabel.text = beginnerBack[indexPath.row] + " - \(generateRandomNumber()) sets of 3 reps"
            }
            
            else if (indexPath.row < 2)
            {
                let index = Int.random(in: 0...1)
                cell.exerciseLabel.text = beginnerBack2[index]
                if (cell.exerciseLabel.text == "Barbell Rows")
                {
                    cell.exerciseLabel.text = "Barbell Rows - \(generateRandomNumber()) sets of 8-12 reps"
                }
                else
                {
                    cell.exerciseLabel.text = "Cable Rows - \(generateRandomNumber()) sets of 8-12 reps"
                }
            }
                
            else
            {
                cell.exerciseLabel.text = beginnerBack[indexPath.row - 1] + " - \(generateRandomNumber()) sets of 8-12 reps"
                
            }
            return cell
        }
    
    func generateNextImage(d: Int) -> Int
    {
        return d+1
    }
    
    @objc func checkMarkPressed(sender: UIButton)
    {
        guard let cell = sender.superview?.superview as? CheckMarkCell else {
            return
        }
        
        var indexPath = BBTable?.indexPath(for: cell)
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
            let cell1 = BBTable?.cellForRow(at: indexPath!) as! CheckMarkCell
            if (!(cell1.checkButton.isSelected))
            {
                row = indexPath!.row
                if(row == 1 && cell1.exerciseLabel.text?.prefix(7) == "Barbell")
                {
                    exerciseImage?.image = UIImage(named: "Barbell Rows")
                }
                else if (row == 1 && cell1.exerciseLabel.text?.prefix(5) == "Cable")
                {
                    exerciseImage?.image = UIImage(named: "Cable Rows")
                }
                
                else
                {
                    exerciseImage?.image = UIImage(named: "BB\(generateNextImage(d: row))")
                }
                break
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
        BBTable?.register(UINib.init(nibName: "CheckMarkCell", bundle: nil), forCellReuseIdentifier: "CheckListIdentifier")
        
    }
    
    func generateRandomNumber() -> String
    {
        i = Int.random(in: 2...3)
        return String(i)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.dataLabel!.text = dataObject
        
    }
        
}



