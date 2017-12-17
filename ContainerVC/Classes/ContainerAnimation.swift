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
    
    public func duration() -> TimeInterval {
        return TimeInterval(UINavigationControllerHideShowBarDuration)
    }
    
    public func animate(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        container.addSubview(toView)
        
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration()
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        animate(transitionContext: transitionContext)
    }
}
