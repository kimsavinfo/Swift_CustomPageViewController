//
//  TipsDataViewController.swift
//  CustomPageViewController
//
//  Created by Kim SAVAROCHE on 21/08/2016.
//  Copyright © 2016 Kim SAVAROCHE. All rights reserved.
//

import UIKit

class TipsDataViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = "Tips for \n" + dataObject
    }
    
    
}


