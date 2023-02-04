//
//  WelcomeScreenController.swift
//  Workout Generator
//
//  Created by Yash Hindka on 8/7/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit
import GoogleMobileAds

class BCDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //number exercises in beginner workout
    let a:Int = 4;
    
    let beginnerChest = ["Flat Bench Press", "Pushups"]
    let b = ["Incline Bench Press", "Cable Fly", "Rope Pushdown"]
    
    var i:Int = 0
    
    var x:Int = 1;
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var exerciseTable: UITableView?
    
    @IBOutlet weak var exerciseImage: UIImageView?
    
    
    @IBOutlet weak var adBanner: GADBannerView!
    
    var dataObject: String = ""
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return a;
    }
    func generateRandomNumber() -> String
    {
        i = Int.random(in: 2...3)
        return String(i)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! CheckMarkCell
        cell.selectionStyle = .none
        cell.checkButton.addTarget(self, action: #selector(checkMarkPressed(sender: )), for: .touchUpInside)
        
        
        if(indexPath.row < 1)
        {
            let index = Int.random(in: 0...1)
            cell.exerciseLabel.text = beginnerChest[index]
            if (cell.exerciseLabel.text == "Pushups")
            {
                cell.exerciseLabel.text = "Pushups - \(generateRandomNumber()) sets of 10 reps"
                exerciseImage?.image = UIImage(named: "Pushups")
            }
            else
            {
                cell.exerciseLabel.text = "Flat Bench Press - \(generateRandomNumber()) sets of 3-5 reps"
                exerciseImage?.image = UIImage(named: "BC1")
            }
        }
            
        else
        {
            cell.exerciseLabel.text = b[indexPath.row - 1] + " - \(generateRandomNumber()) sets of 8-12 reps"
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
            sender.isSelected = false;
            
        }
        else
        {
            sender.isSelected = true;
            
            
        }
        
        for n in 0...3
        {
            indexPath = IndexPath(row: n, section: 0)
            let cell1 = exerciseTable?.cellForRow(at: indexPath!) as! CheckMarkCell
            if (!(cell1.checkButton.isSelected))
            {
                row = indexPath!.row
                if(row == 0 && cell1.exerciseLabel.text?.prefix(7) == "Pushups")
                {
                    exerciseImage?.image = UIImage(named: "Pushups")
                }
                else
                {
                    exerciseImage?.image = UIImage(named: "BC\(generateNextImage(d: row))")
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
        exerciseTable?.register(UINib.init(nibName: "CheckMarkCell", bundle: nil), forCellReuseIdentifier: "CheckListIdentifier")
        
        
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.dataLabel!.text = dataObject
        
    }
    
    
    
    
}



