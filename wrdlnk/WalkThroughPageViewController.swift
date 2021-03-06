//
//  WalkThroughPageViewController.swift
//  wrdlnk
//
//  Created by sparkle on 8/6/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit

class WalkThroughPageViewController: UIPageViewController, UIPageViewControllerDataSource,
    UIPageViewControllerDelegate, WalkThroughLastPageViewControllerDelegate  {

    var walkThroughLastPageDelegate:WalkThroughLastPageViewControllerDelegate?
    
    lazy var VCArray: [UIViewController] = {
        return [
            self.VCInstance(name: "WalkThroughOneViewController"),
            self.VCInstance(name: "WalkThroughTwoViewController"),
            self.VCInstance(name: "WalkThroughThreeViewController"),
            self.VCInstance(name: "WalkThroughLastPageViewController")
        ]
    }()
    
    deinit {
        VCArray.removeAll()
        walkThroughLastPageDelegate = nil
        self.view.removeFromSuperview()
    }
    
    private func VCInstance(name: String) -> UIViewController {
        return  UIStoryboard(name: StoryboardName.Onboarding.rawValue, bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.frame.origin.y = self.view.frame.size.height - 190 * layoutRatio.currentHeightScaleFactor
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = VCArray.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        self.view.backgroundColor = backgroundColor
        
        #if false
            AppTheme.instance.set(for: self, viewType: "InstructionView")
        #endif
    }

    func lastVC(currentVC: UIViewController) -> UIViewController {
        if currentVC.nibName == VCArray.last?.nibName {
            (currentVC as! WalkThroughLastPageViewController).delegate = self
        }
        return currentVC
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex > -1 else {
            return nil
        }
        
        guard previousIndex >= 0 else {
            return VCArray.last
        }
        
        guard VCArray.count >= previousIndex else {
            return nil
        }
        
        return lastVC(currentVC: VCArray[previousIndex])
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard VCArray.count > nextIndex else {
            return nil
        }

        return lastVC(currentVC: VCArray[nextIndex])
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = foregroundColor.withAlphaComponent(0.5)
        appearance.currentPageIndicatorTintColor = foregroundColor
        appearance.backgroundColor = .clear
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        setupPageControl()
        return VCArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = pageViewController.viewControllers?.first,
            let firstViewControllerIndex = VCArray.firstIndex(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }

    func afterWalkThrough() {
        launchFromStoryboard(name: StoryboardName.Main.rawValue, controller: "GameViewController")
    }
    
    // MARK:- Delegate method
    func lastPageDone()
    {
          afterWalkThrough()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
