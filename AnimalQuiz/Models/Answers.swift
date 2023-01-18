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
}

struct Answers {
    var type: AnimalsType
    var text: String
}
