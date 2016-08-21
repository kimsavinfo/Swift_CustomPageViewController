//
//  TipsModelController.swift
//  CustomPageViewController
//
//  Created by Kim SAVAROCHE on 21/08/2016.
//  Copyright © 2016 Kim SAVAROCHE. All rights reserved.
//

import UIKit

class TipsModelController: NSObject, UIPageViewControllerDataSource {
    
    var pageData: [String] = []
    
    override init() {
        super.init()
        
        // Create the data model
        let dateFormatter = NSDateFormatter()
        pageData = dateFormatter.monthSymbols
    }
    
    func getNumberOfPageData() -> Int {
        return self.pageData.count
    }
    
    func viewControllerAtIndex(index: Int, storyboard: UIStoryboard) -> TipsDataViewController? {
        // Return the data view controller for the given index
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        // Create a new view controller and pass the data you want to show
        let dataViewController = storyboard.instantiateViewControllerWithIdentifier("TipsDataViewController") as! TipsDataViewController
        dataViewController.dataObject = self.pageData[index]
        return dataViewController
    }
    
    func indexOfViewController(viewController: TipsDataViewController) -> Int {
        return pageData.indexOf(viewController.dataObject) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source : can loop
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! TipsDataViewController)
        if (index == 0) || (index == NSNotFound) {
            index = self.pageData.count;
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! TipsDataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            index = 0;
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
}


