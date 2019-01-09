//
//  ViewController.swift
//  What animal are you
//
//  Created by Магомед on 05.12.2018.
//  Copyright © 2018 Vokhstag. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var startButton: UIButton! {
        didSet {
            startButton.layer.cornerRadius = 10
            
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }



}

