//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Dovydas Dorofejevas on 18/11/2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    //var answer: String
    var answers: [String]
    var correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answers = a
        self.correctAnswer = correctAnswer
    }
    
}
