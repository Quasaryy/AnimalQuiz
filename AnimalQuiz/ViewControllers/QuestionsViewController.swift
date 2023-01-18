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
    
    // Elements of third stack view
    @IBOutlet var slider: UISlider!
    @IBOutlet var labelsThirdSV: [UILabel]!
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IB Actions
    @IBAction func buttonfirstVCTapped() {
    }
    
    @IBAction func buttonSecondVCTapped() {
    }
    
    @IBAction func buttonThirdVCTapped() {
    }
    
}
