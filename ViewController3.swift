//
//  ViewController3.swift
//  Workout Generator
//
//  Created by Yash Hindka on 8/9/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    
    @IBOutlet weak var shouldersButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shouldersButton.addTarget(self, action: #selector(buttonPressed(_sender:)), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    @objc func buttonPressed(_sender: UIButton)
    {
        if(level == 1)
        {
            let page = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TBSW2") as! BSDataViewController
            present(page, animated: true, completion: nil)
        }
        else if(level == 2)
        {
            let page = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TISW") as! ISDataViewController
            present(page, animated: true, completion: nil)
        }
        else if (level == 3)
        {
            let page = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TASW") as! ASDataViewController
            present(page, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
