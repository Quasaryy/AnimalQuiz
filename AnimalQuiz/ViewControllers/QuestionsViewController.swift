//
//  QuestionsViewController.swift
//  AnimalQuiz
//
//  Created by Yury on 18.01.23.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: IB Outlets
    @IBOutlet var progressQuiz: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    // Stack of stack views :)
    @IBOutlet var stackViews: [UIStackView]!
    
    // Elements of first stack view
    @IBOutlet var buttonsFirstSV: [UIButton]!

    // Elements of second stack view
    @IBOutlet var labelsSecondSV: [UILabel]!
    @IBOutlet var switchers: [UISwitch]!
    
    // Elements of third stack view
    @IBOutlet var slider: UISlider!
    @IBOutlet var labelsThirdSV: [UILabel]!
    
    // MARK: Properties
    var questions = Questions.getQuestions()
    var currentIndex = 0
    var currentQuestion = QuestionNumbers.first
    var currentAnswers: [Answers] {
        questions[currentIndex].answers
    }
    var userAnswers: [AnimalsType] = []

    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuestion()
    }
    
    // MARK: IB Actions

    @IBAction func buttonFirstSVTapped(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case currentAnswers[0].text:
            userAnswers.append(currentAnswers[0].type)
        case currentAnswers[1].text:
            userAnswers.append(currentAnswers[1].type)
        case currentAnswers[2].text:
            userAnswers.append(currentAnswers[2].type)
        case currentAnswers[3].text:
            userAnswers.append(currentAnswers[3].type)
        default:
            print("Something wrong with buttons")
        }
        nextQuestion()
    }
    
    @IBAction func buttonSecondSVTapped() {
        for switcher in switchers {
            if switcher.tag == 0 && switcher.isOn { userAnswers.append(currentAnswers[0].type) }
            if switcher.tag == 1 && switcher.isOn { userAnswers.append(currentAnswers[1].type) }
            if switcher.tag == 2 && switcher.isOn { userAnswers.append(currentAnswers[2].type) }
            if switcher.tag == 3 && switcher.isOn { userAnswers.append(currentAnswers[3].type) }
        }
        nextQuestion()
    }
    
    @IBAction func buttonThirdSVTapped() {
        
    }
    
}

// MARK: Private Methods
extension QuestionsViewController {
    
    // Hide all stack views on start
    private func hideAllStackViews() {
        for stackView in stackViews {
            stackView.isHidden = true
        }
    }
    
    // Updating screen with next stack view and question
    private func updateQuestion() {
        hideAllStackViews()
        stackViews[currentIndex].isHidden = false
        title = "Question \(currentIndex + 1) from \(questions.count)"
        progressQuiz.setProgress(Float(currentIndex) / Float(questions.count), animated: true)
        
        questionLabel.text = questions[currentIndex].text
        
        switch currentQuestion {
        case .first:
            firstQuestion()
        case .second:
            secondQuestion()
        case .third:
            thirdQuestion()
        }
        
    }
    
    // Next question after tapping Answer button
    private func nextQuestion() {
//        if currentIndex >= (questions.count - 1) {
//            currentIndex = 0
//        } else {
//            currentIndex += 1
//        }
        currentIndex += 1
        currentQuestion.nextQuestion()
        updateQuestion()
    }
    
    private func firstQuestion() {
        for (button, answer) in zip(buttonsFirstSV,  currentAnswers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func secondQuestion() {
        var incrementor = 0
        for (label, answer) in zip(labelsSecondSV, currentAnswers)  {
            label.text = answer.text
            switchers[incrementor].tag = incrementor
            incrementor += 1
        }
    }
    
    private func thirdQuestion() {
        //
    }
    
}
