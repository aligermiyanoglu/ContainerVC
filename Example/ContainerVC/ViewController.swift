//
//  ViewController.swift
//  ContainerVC
//
//  Created by Ali Germiyanoglu on 11.12.2017.
//  Copyright © 2017 aeg. All rights reserved.
//

import UIKit
import ContainerVC

public final class ViewController: UIViewController {
    private var navController: ContainerVC?
    private var flipper = 0
    
    override public func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if let container = segue.destination as? ContainerVC {
            navController = container
            navController?.animator = FlashAnimation()
        }
    }
    
    private func nextSegue() -> String {
        flipper = flipper + 1
        
        return (flipper % 2 != 0) ? "blue" : "red"
    }
    
    @IBAction func didPress(_ sender: Any) {
        navController?.performSegue(withIdentifier: nextSegue(),
                                    sender: self)
    }
}
