//
//  ViewController.swift
//  ContainerVC
//
//  Created by Ali Germiyanoglu on 11.12.2017.
//  Copyright © 2017 aeg. All rights reserved.
//

import UIKit
import ContainerVC

class ViewController: UIViewController {
    var navController: ContainerVC?
    var counter = 0
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if segue.identifier == "container" {
            self.navController = segue.destination as? ContainerVC
            self.navController?.animator = FlashAnimation()
        }
    }
    
    @IBAction func didPress(_ sender: Any) {
        counter = counter + 1
        
        if counter % 2 != 0 {
            self.navController?.performSegue(withIdentifier: "blue", sender: self)
        } else {
            self.navController?.performSegue(withIdentifier: "red", sender: self)
        }
    }
}

