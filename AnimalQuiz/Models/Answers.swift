//
//  Answers.swift
//  AnimalQuiz
//
//  Created by Yury on 18.01.23.
//

enum AnimalsType: Character {
    case cat = "🐱"
    case dog = "🐶"
    case turtle = "🐢"
    case rabbit = "🐰"
    
    func description() -> String {
        switch self {
            case .cat:
                return "You're on your own. Love to walk by yourself. You value solitude."
            case .dog:
                return "You enjoy being with friends. You surround yourself with people you like and are always willing to help."
            case .turtle:
                return "Your strength is in wisdom. Slow and thoughtful wins over long distances."
            case .rabbit:
                return "You like everything soft. You are healthy and full of energy."
        }
    }
}

struct Answers {
    var type: AnimalsType
    var text: String
}
