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
    @IBOutlet var slider: UISlider! {
        didSet {
            slider.maximumValue = Float(currentAnswers.count - 1)
        }
    }
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
        guard let indexButton = buttonsFirstSV.firstIndex(of: sender) else { return }
        userAnswers.append(currentAnswers[indexButton].type)
        
        nextQuestion()
    }
    
    // // Actions after tapping on button from second stack view
    @IBAction func buttonSecondSVTapped() {
        for (switcher, answer) in zip(switchers, currentAnswers) {
            if switcher.isOn {
                userAnswers.append(answer.type)
            }
        }
        
        nextQuestion()
    }
    
    // Actions after tapping on button from third stack view
    @IBAction func buttonThirdSVTapped() {
        let indexFromSliderValue = lrintf(slider.value)
        userAnswers.append(currentAnswers[indexFromSliderValue].type)
        
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
        labelsThirdSV.first?.text = currentAnswers.first?.text
        labelsThirdSV.last?.text = currentAnswers.last?.text
    }
    
    // Calculating total animal types in userAnswers array and calculating most frequency animal type with saving to var whoYouAre
    private func animalCalulating() {
        var animalDictionary: [AnimalsType: Int] = [:]
        
        for answer in userAnswers {
            if let animal = animalDictionary[answer] {
                animalDictionary.updateValue(animal + 1, forKey: answer)
            } else {
                animalDictionary[answer] = 1
            }
        }
        
        let sortedAnimalDictionary = animalDictionary.sorted { $0.value > $1.value }
        whoYouAre = sortedAnimalDictionary.first?.key
        
        // Other variant of calculating
//        let sortedAnimalDictionary2 = Dictionary(grouping: userAnswers, by: { $0 })
//            .sorted(by: { $0.value.count > $1.value.count })
//            .first?.key
//        whoYouAre = sortedAnimalDictionary2
    }
    
}
