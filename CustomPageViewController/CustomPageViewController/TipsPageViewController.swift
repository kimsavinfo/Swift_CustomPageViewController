//
//  TipsPageViewController.swift
//  CustomPageViewController
//
//  Created by Kim SAVAROCHE on 21/08/2016.
//  Copyright © 2016 Kim SAVAROCHE. All rights reserved.
//

import UIKit


class TipsPageViewController: UIPageViewController {
    
    weak var tipsDelegate: TipsPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the moel and set it as the data source
        let startingViewController: TipsDataViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })
        self.dataSource = self.modelController
        
        tipsDelegate?.tipsPageViewController(self, didUpdatePageCount: self.modelController.getNumberOfPageData())
    }
    
    var _modelController: TipsModelController? = nil
    var modelController: TipsModelController {
        if _modelController == nil {
            _modelController = TipsModelController()
        }
        return _modelController!
    }
    
    private func notifyTutorialDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = self.viewControllers?.indexOf(firstViewController) {
            // let index = orderedViewControllers.indexOf(firstViewController) {
            tipsDelegate?.tipsPageViewController(self,didUpdatePageIndex: index)
        }
    }
    
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewControllerNavigationDirection = .Forward) {
        setViewControllers([viewController],
                           direction: direction,
                           animated: true,
                           completion: { (finished) -> Void in
                            // Setting the view controller programmatically does not fire
                            // any delegate methods, so we have to manually notify the
                            // 'tutorialDelegate' of the new index.
                            self.notifyTutorialDelegateOfNewIndex()
        })
    }
    
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = self.viewControllers?.indexOf(firstViewController) {
            let direction: UIPageViewControllerNavigationDirection = newIndex >= currentIndex ? .Forward : .Reverse
            let nextViewController = self.viewControllers?[newIndex]
            scrollToViewController(nextViewController!, direction: direction)
        }
    }
    
    func scrollToNextViewController(){
        if let visibleViewController = viewControllers?.first,
            let nextViewController = self.modelController.pageViewController(self, viewControllerAfterViewController: visibleViewController) {
            scrollToViewController(nextViewController)
        }
    }
    
}

protocol TipsPageViewControllerDelegate: class {
    func tipsPageViewController(tipsPageViewController: TipsPageViewController, didUpdatePageCount count: Int)
    func tipsPageViewController(tipsPageViewController: TipsPageViewController, didUpdatePageIndex index: Int)
}