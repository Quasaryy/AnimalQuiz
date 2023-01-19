//
//  Questions.swift
//  AnimalQuiz
//
//  Created by Yury on 18.01.23.
//

enum QuestionNumbers {
    case first
    case second
    case third
    
    mutating func nextQuestion() {
        switch self {
        case .first:
            self = .second
        case .second:
            self = .third
        case .third:
            break
        }
    }
}

struct Questions {
    var text: String
    var answers: [Answers]
    static func getQuestions() -> [Questions] {
        return [
            Questions(text: "What kind of food do you prefer",
                      answers: [
                Answers(type: .cat, text: "Fish"),
                Answers(type: .dog, text: "Steak"),
                Answers(type: .turtle, text: "Сorn"),
                Answers(type: .rabbit, text: "Сarrot")
            ]),
            Questions(text: "What do you like to do",
                      answers: [
                Answers(type: .cat, text: "Sleep"),
                Answers(type: .dog, text: "Cuddle"),
                Answers(type: .turtle, text: "Swimm"),
                Answers(type: .rabbit, text: "Eat")
            ]),
            Questions(text: "Do you like car trips",
                      answers: [
                Answers(type: .dog, text: "Adore"),
                Answers(type: .cat, text: "Like"),
                Answers(type: .turtle, text: "Not really"),
                Answers(type: .rabbit, text: "Hate"),
            ])
        ]
    }
}
