//
//  TipsRootViewController.swift
//  CustomPageViewController
//
//  Created by Kim SAVAROCHE on 21/08/2016.
//  Copyright © 2016 Kim SAVAROCHE. All rights reserved.
//

import UIKit

class TipsRootViewController: UIViewController {
    
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changePageControlColour()
    }
    
    func changePageControlColour() {
        pageControl.currentPageIndicatorTintColor = UIColor(red:0.40, green:0.42, blue:0.46, alpha:1.0)
        pageControl.pageIndicatorTintColor = UIColor(red:0.72, green:0.72, blue:0.84, alpha:1.0)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


