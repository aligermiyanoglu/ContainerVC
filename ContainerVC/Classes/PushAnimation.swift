//
//  PresentAnimation.swift
//  ContainerVC
//
//  Created by Ali Germiyanoglu on 11.12.2017.
//  Copyright © 2017 aeg. All rights reserved.
//

import Foundation
import UIKit

public class PushAnimation: ContainerAnimation {
    
    override public func animate(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        container.addSubview(toView)
        
        toView.frame = CGRect(x: fromView.frame.width,
                              y: 0,
                              width: toView.frame.width,
                              height: toView.frame.height)
        toView.alpha = 0
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       animations: {
                        toView.frame = fromView.frame
                        toView.alpha = 1
        },
                       completion: { (finished) in
                        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
