//
//  ContainerAnimationProtocol.swift
//  ContainerVC
//
//  Created by Ali Germiyanoglu on 11.12.2017.
//  Copyright © 2017 aeg. All rights reserved.
//

import Foundation
import UIKit

public protocol ContainerAnimationProtocol where Self: UIViewControllerAnimatedTransitioning {
    
    func duration() -> TimeInterval
    
    func animate(transitionContext: UIViewControllerContextTransitioning)
}
