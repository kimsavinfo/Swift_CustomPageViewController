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
    var tipsPageViewController: TipsPageViewController? {
        didSet {
            tipsPageViewController?.tipsDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPageControl()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let tipsPageViewController = segue.destinationViewController as? TipsPageViewController {
            self.tipsPageViewController = tipsPageViewController
        }
    }
    
    func setPageControl() {
        pageControl.addTarget(self, action: #selector(TipsRootViewController.didChangePageControlValue), forControlEvents: .ValueChanged)
        pageControl.currentPageIndicatorTintColor = UIColor(red:0.40, green:0.42, blue:0.46, alpha:1.0)
        pageControl.pageIndicatorTintColor = UIColor(red:0.72, green:0.72, blue:0.84, alpha:1.0)
    }
    
    func didChangePageControlValue() {
        tipsPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
    
    @IBAction func nextButtonPressed(sender: UIButton) {
        tipsPageViewController?.scrollToNextViewController()
    }
    @IBAction func previousButtonPressed(sender: UIButton) {
        tipsPageViewController?.scrollToPreviousViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TipsRootViewController: TipsPageViewControllerDelegate {
    
    func tipsPageViewController(tipsPageViewController: TipsPageViewController,
                                didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func tipsPageViewController(tipsPageViewController: TipsPageViewController,
                                didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}
