//
//  PageViewController.swift
//  Workout Generator
//
//  Created by Yash Hindka on 8/9/19.
//  Copyright © 2019 Hindka. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var pageViewController = UIPageViewController()
    
    lazy var subViewControllers: [UIViewController] = {
        
        return [UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC1") as! ViewController1, UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC2") as! ViewController2, UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC3") as! ViewController3, UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC4") as! ViewController4]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        let index:Int = subViewControllers.index(of: viewController) ?? 0
        if(index <= 0)
        {
            return nil
        }
        return subViewControllers[index - 1]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index:Int = subViewControllers.index(of: viewController) ?? 0
        if(index >= (subViewControllers.count - 1)){
            return nil
        }
        return subViewControllers[index + 1]
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
