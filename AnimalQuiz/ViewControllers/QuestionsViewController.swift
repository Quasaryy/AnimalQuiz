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
    var whoYouAre: AnimalsType!

    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuestion()
    }
    
    // MARK: IB Actions
    // Actions after tapping on button from first stack view
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
    
    // // Actions after tapping on button from second stack view
    @IBAction func buttonSecondSVTapped() {
        for switcher in switchers {
            if switcher.tag == 0 && switcher.isOn { userAnswers.append(currentAnswers[0].type) }
            if switcher.tag == 1 && switcher.isOn { userAnswers.append(currentAnswers[1].type) }
            if switcher.tag == 2 && switcher.isOn { userAnswers.append(currentAnswers[2].type) }
            if switcher.tag == 3 && switcher.isOn { userAnswers.append(currentAnswers[3].type) }
        }
        nextQuestion()
    }
    
    // Actions after tapping on button from third stack view
    @IBAction func buttonThirdSVTapped() {
        if slider.value <= 0.24 { userAnswers.append(currentAnswers[0].type) }
        if 0.25..<0.50 ~= slider.value { userAnswers.append(currentAnswers[1].type) }
        if 0.50..<0.75 ~= slider.value { userAnswers.append(currentAnswers[2].type) }
        if 0.75...1 ~= slider.value { userAnswers.append(currentAnswers[3].type) }
        
        // Calculating animal type and saving to var whoYouAre
        animalCalulating()
        performSegue(withIdentifier: "results", sender: nil)
    }
    
    // Sending animal type from var whoYouAre to ResultsViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as? ResultViewController
        resultVC?.animal = whoYouAre
    }
    
}

// MARK: Private Methods
extension QuestionsViewController {
    
    // Hide all stack views on app start and after tapping on the Answer button
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
        currentIndex += 1
        currentQuestion.nextQuestion()
        updateQuestion()
    }
    
    // Getting data for first stack view UI elements
    private func firstQuestion() {
        for (button, answer) in zip(buttonsFirstSV,  currentAnswers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    // Getting data for second stack view UI elements
    private func secondQuestion() {
        var incrementor = 0
        for (label, answer) in zip(labelsSecondSV, currentAnswers)  {
            label.text = answer.text
            switchers[incrementor].tag = incrementor
            switchers[incrementor].isOn = false
            incrementor += 1
        }
    }
    
    // Getting data for third stack view UI elements
    private func thirdQuestion() {
        for (label, answer) in zip(labelsThirdSV, currentAnswers) {
            label.text = answer.text
        }
    }
    
    // Calculating total animal types in userAnswers array and calculating final animal type with saving to var whoYouAre
    private func animalCalulating() {
        var cats = 0
        var dogs = 0
        var turtles = 0
        var rabbits = 0
        
        for animalType in userAnswers {
            switch animalType {
            case .cat:
                cats += 1
            case .dog:
                dogs += 1
            case .turtle:
                turtles += 1
            case .rabbit:
                rabbits += 1
            }
        }
        
        if cats >= dogs, cats >= turtles, cats >= rabbits {
            whoYouAre = AnimalsType.cat
        } else if dogs >= cats, dogs >= turtles, dogs >= rabbits {
            whoYouAre = AnimalsType.dog
        } else if turtles >= cats, turtles >= dogs, turtles >= rabbits {
            whoYouAre = AnimalsType.turtle
        } else if rabbits >= cats, rabbits >= dogs, rabbits >= turtles {
            whoYouAre = AnimalsType.rabbit
        }
    }
    
}
