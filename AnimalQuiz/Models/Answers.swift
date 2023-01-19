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
            return "ssdfdsfdsfsfsdf"
        case .dog:
            return "ssdfdsfdsfsfsdf"
        case .turtle:
            return "ssdfdsfdsfsfsdf"
        case .rabbit:
            return "ssdfdsfdsfsfsdf"
        }
    }
}

struct Answers {
    var type: AnimalsType
    var text: String
}
