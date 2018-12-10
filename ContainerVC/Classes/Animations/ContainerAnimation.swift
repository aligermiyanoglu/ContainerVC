//
//  ContainerAnimation.swift
//  ContainerVC
//
//  Created by Ali Germiyanoglu on 11.12.2017.
//  Copyright © 2017 aeg. All rights reserved.
//

import Foundation
import UIKit

public typealias ContainerAnimator = UIViewControllerAnimatedTransitioning &  UINavigationControllerDelegate & ContainerAnimationProtocol

open class ContainerAnimation: NSObject, ContainerAnimator {
    
    /* ContainerAnimationProtocol Methods */
    /**************************************/
    
    open func duration() -> TimeInterval {
        return TimeInterval(UINavigationController.hideShowBarDuration)
    }
    
    open func animate(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        container.addSubview(toView)
        
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
    
    
    /* UIViewControllerAnimatedTransitioning Methods */
    /*************************************************/
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration()
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        animate(transitionContext: transitionContext)
    }
}
