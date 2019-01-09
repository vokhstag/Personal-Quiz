//
//  ResultViewController.swift
//  What animal are you
//
//  Created by Магомед on 14.12.2018.
//  Copyright © 2018 Vokhstag. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var answers = [Answer]()
    var anymalType = [AnymalType]()
    var anymalCat = 0
    var anymalDog = 0
    var anymalTurtle = 0
    var anymalRabbit = 0
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        for index in 0..<answers.count {
            anymalType.append(answers[index].animal)
            switch anymalType[index] {
            case .cat:
                anymalCat += 1
            case .dog:
                anymalDog += 1
            case .rabbit:
                anymalRabbit += 1
            case .turtle:
                anymalTurtle += 1
            }
        }
        if anymalCat > anymalDog {
            if anymalCat > anymalRabbit {
                if anymalCat > anymalTurtle {
                    // Cat
                    resultLabel.text = "Вы - это \(AnymalType.cat.rawValue)"
                    descriptionLabel.text = AnymalType.cat.difinition
                }
            } else if anymalRabbit > anymalTurtle {
                // rabbit
                resultLabel.text = "Вы - это \(AnymalType.rabbit.rawValue)"
                descriptionLabel.text = AnymalType.rabbit.difinition
            } else {
                // turtle
                resultLabel.text = "Вы - это \(AnymalType.turtle.rawValue)"
                descriptionLabel.text = AnymalType.turtle.difinition
            }
        } else if anymalDog > anymalRabbit {
            if anymalDog > anymalTurtle {
                // Dog
                resultLabel.text = "Вы - это \(AnymalType.dog.rawValue)"
                descriptionLabel.text = AnymalType.dog.difinition
            } else {
                // Turtle
                resultLabel.text = "Вы - это \(AnymalType.turtle.rawValue)"
                descriptionLabel.text = AnymalType.turtle.difinition
            }
        } else if anymalRabbit > anymalTurtle {
            // rabbit
            resultLabel.text = "Вы - это \(AnymalType.rabbit.rawValue)"
            descriptionLabel.text = AnymalType.rabbit.difinition
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
