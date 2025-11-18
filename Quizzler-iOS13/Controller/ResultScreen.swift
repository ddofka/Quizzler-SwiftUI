//
//  SwiftUIView.swift
//  Quizzler
//
//  Created by Dovydas Dorofejevas on 19/11/2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultScreen: UIViewController {
    
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    var finalScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalScoreLabel.text = "Final Score: \(finalScore)"
    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        if let quizVC = presentingViewController as? ViewController {
            quizVC.quizBrain.reset()
            quizVC.updateUI()
        }
        dismiss(animated: true)
    }
}
