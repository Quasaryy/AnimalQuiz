//
//  AnswerViewController.swift
//  AnimalQuiz
//
//  Created by Yury on 18.01.23.
//

import UIKit

class ResultViewController: UIViewController {
        
    @IBOutlet var youAreLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var animal: AnimalsType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        youAreLabel.text = "You are - \(animal.rawValue)!"
        descriptionLabel.text = animal.description()
    }

}
