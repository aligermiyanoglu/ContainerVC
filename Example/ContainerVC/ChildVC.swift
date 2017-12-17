//
//  ChildVC.swift
//  ContainerVC
//
//  Created by Ali Germiyanoglu on 12.12.2017.
//  Copyright © 2017 aeg. All rights reserved.
//

import Foundation
import UIKit

public class ChildVC: UIViewController {
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("\(self) viewDidAppear")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(self) viewDidLoad")
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("\(self) viewWillAppear")
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("\(self) viewWillDisappear")
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("\(self) viewDidDisappear")
    }
    
    deinit {
        print("\(self) deinit")
    }
}
