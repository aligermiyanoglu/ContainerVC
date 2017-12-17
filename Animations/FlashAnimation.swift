//
//  FlashAnimation.swift
//  ContainerVC
//
//  Created by Ali Germiyanoglu on 11.12.2017.
//  Copyright © 2017 aeg. All rights reserved.
//

import Foundation
import UIKit

public class FlashAnimation: ContainerAnimation {
    
    override public func duration() -> TimeInterval {
        return TimeInterval(0.4)
    }

    override public func animate(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        container.insertSubview(toView, belowSubview: fromView)
        
        toView.alpha = 1
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       animations: {
                        fromView.alpha = 0
        },
                       completion: { (finished) in
                        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
