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
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        }
    }
}

struct Answers {
    var type: AnimalsType
    var text: String
}
