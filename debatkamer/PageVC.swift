//
//  PageVC.swift
//  debatkamer
//
//  Created by Ruud Slagers on 12/05/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper
import FirebaseDatabase


class PageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var VCArr: [UIViewController] = {
        return [self.VCInstance(name: "FirstVC"),
                self.VCInstance(name: "SecondVC"),
                self.VCInstance(name: "ThirthVC")]
    }()
    
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)        
        self.dataSource = self
        self.delegate = self
        
        
        //navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIImage(named:"00000000-logout.png"), target: self, action: #selector(addTapped))
       // var image = UIImage(named: "00000000-logout.png")
        
        //image = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: self, action: #selector(logoutTapped))
        
        
        
        
        if let firstVC = VCArr.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
            
            
        }
        
    }
    
    func logoutTapped() {
        
        let keychainResult = KeychainWrapper.standard.remove(key: KEY_UID)
        print("ADMIN: ID verwijderd van keychain \(keychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "GoToSignIn", sender: nil)

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArr.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return VCArr.last
        }
        
        guard VCArr.count > previousIndex else {
            return nil
        }
        
        return  VCArr[previousIndex]
    }
    

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArr.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < VCArr.count else {
            return VCArr.first
        }
        
        guard VCArr.count > nextIndex else {
            return nil
        }
        
        return  VCArr[nextIndex]
    }
    
    


    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArr.count
    }
    

    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = VCArr.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
}
