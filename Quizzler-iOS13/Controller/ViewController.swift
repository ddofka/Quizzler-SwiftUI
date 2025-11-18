//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    
    var quizBrain = QuizBrain()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // option1 , option2 or option3 buttons
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor(
                red: 0x4F / 255.0,
                green: 0xB2 / 255.0,
                blue: 0x86 / 255.0,
                alpha: 1.0
            )
        } else {
            sender.backgroundColor = UIColor(
                red: 219 / 255.0,
                green: 34 / 255.0,
                blue: 42 / 255.0,
                alpha: 1.0
            )
        }
        
        disableButtons()
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: {
            _ in
            
            if self.quizBrain.isLastQuestion() == true {
                //go to result screen
                self.performSegue(withIdentifier: "goToResult", sender: self)
            } else {
                //move to next question
                self.quizBrain.nextQuestion()
                self.updateUI()
            }
            
        })
    }
    
    func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        optionOne.setTitle(quizBrain.getAnswers()[0], for: .normal)
        optionTwo.setTitle(quizBrain.getAnswers()[1], for: .normal)
        optionThree.setTitle(quizBrain.getAnswers()[2], for: .normal)
        
        optionOne.backgroundColor = UIColor.clear
        optionTwo.backgroundColor = UIColor.clear
        optionThree.backgroundColor = UIColor.clear
        
        optionOne.isEnabled = true
        optionTwo.isEnabled = true
        optionThree.isEnabled = true
        
    }
    
    func disableButtons(){
        self.optionOne.isEnabled = false
        self.optionTwo.isEnabled = false
        self.optionThree.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultScreen
            destinationVC.finalScore = quizBrain.getScore()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        quizBrain.reset()
        updateUI()
    }
}

