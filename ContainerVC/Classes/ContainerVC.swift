//
//  ContainerVC.swift
//  ContainerVC
//
//  Created by Ali Germiyanoglu on 11.12.2017.
//  Copyright © 2017 aeg. All rights reserved.
//

import Foundation
import UIKit

public typealias ContainerNavigationDelegate = UINavigationControllerDelegate

open class ContainerVC: UINavigationController, UINavigationControllerDelegate {
    @IBInspectable open var replacesTopVC: Bool = false
    
    weak open var navigationDelegate: ContainerNavigationDelegate?
    
    private func removePreviousVC() {
        let index = viewControllers.count-2
        let subVC = viewControllers[index]
        
        subVC.view.removeFromSuperview()
        subVC.removeFromParent()
    }
    
    open func customize() {
        self.delegate = self
        self.isNavigationBarHidden = true
    }
    
    open func animator(withOperation operation: UINavigationController.Operation) -> ContainerAnimator {
        return ContainerAnimation()
    }
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        customize()
    }
    
    public override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        
        customize()
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        customize()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        customize()
    }
    
    public func navigationController(_ navigationController: UINavigationController,
                                     animationControllerFor operation: UINavigationController.Operation,
                                     from fromVC: UIViewController,
                                     to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator(withOperation: operation)
    }
    
    public func navigationController(_ navigationController: UINavigationController,
                                     willShow viewController: UIViewController,
                                     animated: Bool) {
        navigationDelegate?.navigationController!(navigationController,
                                                  willShow: viewController,
                                                  animated: animated)
    }
    
    public func navigationController(_ navigationController: UINavigationController,
                                     didShow viewController: UIViewController,
                                     animated: Bool) {
        if replacesTopVC && viewControllers.count > 1 {
            removePreviousVC()
        }
        
        navigationDelegate?.navigationController!(navigationController,
                                                  didShow: viewController,
                                                  animated: animated)
    }
    
    public func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        if let navDelegate = navigationDelegate {
            return navDelegate.navigationControllerSupportedInterfaceOrientations!(navigationController)
        }
        
        return .all
    }
    
    public func navigationControllerPreferredInterfaceOrientationForPresentation(_ navigationController: UINavigationController) -> UIInterfaceOrientation {
        if let navDelegate = navigationDelegate {
            return navDelegate.navigationControllerPreferredInterfaceOrientationForPresentation!(navigationController)
        }
        
        return .portrait
    }
    
    public func navigationController(_ navigationController: UINavigationController,
                                     interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return navigationDelegate?.navigationController!(navigationController,
                                                         interactionControllerFor: animationController)
    }
}
