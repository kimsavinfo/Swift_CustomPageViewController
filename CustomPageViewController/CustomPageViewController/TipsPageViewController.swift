//
//  TipsPageViewController.swift
//  CustomPageViewController
//
//  Created by Kim SAVAROCHE on 21/08/2016.
//  Copyright © 2016 Kim SAVAROCHE. All rights reserved.
//

import UIKit


class TipsPageViewController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the moel and set it as the data source
        let startingViewController: TipsDataViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })
        self.dataSource = self.modelController
    }
    
    
    var _modelController: TipsModelController? = nil
    var modelController: TipsModelController {
        if _modelController == nil {
            _modelController = TipsModelController()
        }
        return _modelController!
    }
    
}
