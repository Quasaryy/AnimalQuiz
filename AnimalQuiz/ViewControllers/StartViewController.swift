//
//  ViewController.swift
//  AnimalQuiz
//
//  Created by Yury on 18.01.23.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startButtonTapped() {
        performSegue(withIdentifier: "questions", sender: nil)
    }
    
}

