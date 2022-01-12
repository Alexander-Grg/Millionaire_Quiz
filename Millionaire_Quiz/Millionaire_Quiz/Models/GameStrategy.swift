//
//  GameStrategy.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 21.12.2021.
//

import Foundation
import UIKit

protocol GameModeStrategy: AnyObject {
    func questionPicker(questions: inout [Question], buttons: [UIButton], label: UILabel, answerNumber: inout Int)
}

class RandomGameMode: GameModeStrategy {
    
    var delegate: GameDelegate?
//    var gameMode: SwitchGameMode = .random
    func questionPicker(questions: inout [Question], buttons: [UIButton], label: UILabel, answerNumber: inout Int) {
        guard !questions.isEmpty else { return }
        let questionNumber = Int.random(in: 0..<questions.count)
        answerNumber = questions[questionNumber].correctAnswer
        label.text = questions[questionNumber].question
        for element in 0..<buttons.count {
            buttons[element].setTitle(questions[questionNumber].answers[element], for: .normal)
        }
        questions.remove(at: questionNumber)
    }
}

extension RandomGameMode: GameDelegate {
    func didEndGame(withResult result: Int) {
    }
}

class StandardGameMode : GameModeStrategy {
    
//    var gameMode: SwitchGameMode = .standard
    
    func questionPicker(questions: inout [Question], buttons: [UIButton], label: UILabel, answerNumber: inout Int) {
        guard !questions.isEmpty else { return }
        let questionNumber = 0
        answerNumber = questions[questionNumber].correctAnswer
        label.text = questions[questionNumber].question
        for element in 0..<buttons.count {
            buttons[element].setTitle(questions[questionNumber].answers[element], for: .normal)
        }
        questions.remove(at: questionNumber)
    }
}


