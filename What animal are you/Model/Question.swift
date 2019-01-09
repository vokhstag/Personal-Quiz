//
//  Question.swift
//  What animal are you
//
//  Created by Магомед on 14.12.2018.
//  Copyright © 2018 Vokhstag. All rights reserved.
//

import Foundation

struct Question {
    var question: String
    var type: AnswerType
    var answers: [Answer]
}

enum AnswerType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var animal: AnymalType
}

enum AnymalType: Character {
    case cat = "🐼"
    case rabbit = "🐰"
    case turtle = "🐢"
    case dog = "🐶"
    
    var difinition: String {
        switch self {
        case .cat:
            return "Вы большая здоровая панда.  Вам нравится спать и жрать."
        case .rabbit:
            return "Вам нравится всё мягкое.  Вы здоровы и полны энергии."
        case .turtle:
            return "Вы мудры не по годам.  Медленный и вдумчивый выигрывает гонку.  Тише едешь, дальше будешь."
        case .dog:
            return "Вы любите бывать в компании.  Вы всегда окружены друзьями.  Вам нравиться играть и быть лучшим другом для всех."
            
        }
    }
}
