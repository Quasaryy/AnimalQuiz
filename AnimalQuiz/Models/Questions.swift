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
}

struct Questions {
    var questionNumber: QuestionNumbers
    var text: String
    var answers: [Answers]
    static func getQuestions() -> [Questions] {
        return [
            Questions(questionNumber: .first,
                      text: "What kind of food do you prefer",
                      answers: [
                Answers(type: .cat, text: "Fish"),
                Answers(type: .dog, text: "Steak"),
                Answers(type: .turtle, text: "Сorn"),
                Answers(type: .rabbit, text: "Сarrot")
            ]),
            Questions(questionNumber: .first,
                      text: "What do you like to do",
                      answers: [
                Answers(type: .cat, text: "To sleep"),
                Answers(type: .dog, text: "To cuddle"),
                Answers(type: .turtle, text: "To swimm"),
                Answers(type: .rabbit, text: "To eat")
            ]),
            Questions(questionNumber: .first,
                      text: "Do you like car trips",
                      answers: [
                Answers(type: .cat, text: "Like"),
                Answers(type: .dog, text: "Adore"),
                Answers(type: .turtle, text: "Not really"),
                Answers(type: .rabbit, text: "Hate")
            ])
        ]
    }
}
