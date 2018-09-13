//
//  ContainerAnimation.swift
//  ContainerVC
//
//  Created by Ali Germiyanoglu on 11.12.2017.
//  Copyright © 2017 aeg. All rights reserved.
//

import Foundation
import UIKit

open class ContainerAnimation: NSObject, UIViewControllerAnimatedTransitioning, UINavigationControllerDelegate, ContainerAnimationProtocol {
    
    /* ContainerAnimationProtocol Methods */
    /**************************************/
    
    public func duration() -> TimeInterval {
        return TimeInterval(UINavigationController.hideShowBarDuration)
    }
    
    public func animate(transitionContext: UIViewControllerContextTransitioning) {
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
