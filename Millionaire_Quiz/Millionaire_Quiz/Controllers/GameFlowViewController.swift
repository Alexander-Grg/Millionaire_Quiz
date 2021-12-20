//
//  GameFlowViewController.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 18.12.2021.
//

import UIKit

protocol GameDelegate: AnyObject {
    func didEndGame(withResult result: Int)
}

class GameFlowViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    
    @IBAction func firstButton(_ sender: Any) {
        if answerNumber == 0 {
            answeredQuestions += 1
            questionPicker()
        } else {
            wrongAnswer()
        }
    }
    @IBAction func secondButton(_ sender: Any) {
        if answerNumber == 1 {
            answeredQuestions += 1
            questionPicker()
        } else {
            wrongAnswer()
        }
    }
    @IBAction func thirdButton(_ sender: Any) {
        if answerNumber == 2 {
            answeredQuestions += 1
            questionPicker()
        } else {
            wrongAnswer()
        }
    }
    @IBAction func fourthButton(_ sender: Any) {
        if answerNumber == 3 {
            answeredQuestions += 1
            questionPicker()
        } else {
            wrongAnswer()
        }
    }
    
    var questions = [Question]()
    var questionNumber = Int()
    var answerNumber = Int()
    var answeredQuestions: Int = 0
    weak var gameDelegate: GameDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        questions = [
            Question(question: "Who is the president of Russia?", answers: ["Will Smith", "Bruce Li", "Vladimir Putin", "Barack Obama"], correctAnswer: 2),
            Question(question: "Who won the first oscar as the best actor?", answers: ["Emil Jannings","Janet Gaynor","Charlie Chaplin","Karl Struss"], correctAnswer: 0),
            Question(question: "What is the capital of Chile?", answers: ["Santiago","Melipilla","San Antonio","Melbourne"], correctAnswer: 0),
            Question(question: "What is the highest mountain in Britain?", answers: ["Snowdon","Scafell Pike","Ben Nevis","Everest"], correctAnswer: 1),
            Question(question: "How many players are there in a rugby league team?", answers: ["22","16","7","13"], correctAnswer: 3),
            Question(question: "What is Japanese sake made from?", answers: ["Berries","Corn","Rice","Wheat"], correctAnswer: 2),
            Question(question: "What is the capital of Westeros in Game of Thrones?", answers: ["Riverrun","King’s Landing","Pyke","Casterly Rock"], correctAnswer: 1),
        ]
        questionPicker()
    }
    
    private func questionPicker() {
        if questions.count > 0 {
            questionNumber = 0
            questionLabel.text = questions[questionNumber].question
            answerNumber = questions[questionNumber].correctAnswer
            
            for element in 0..<Buttons.count {
                Buttons[element].setTitle(questions[questionNumber].answers[element], for: .normal)
            }
            questions.remove(at: questionNumber)
        }
        else {
            NSLog("done")
            gameDelegate?.didEndGame(withResult: answeredQuestions)
            let GS = GameSession(date: Date())
            gameSingleton.shared.addSession(GS)
            let winningAlert = UIAlertController(title: "Вы победитель! Все ответы верны.",
                                                 message: nil,
                                                 preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "В главное меню",
                                            style: .default) { UIAlertAction in
                self.performSegue(withIdentifier: "exit", sender: nil)
            }
            winningAlert.addAction(alertAction)
            present(winningAlert, animated: true, completion: nil)
        }
    }
    
    private func wrongAnswer() {
        
        gameDelegate?.didEndGame(withResult: answeredQuestions)
        let GS = GameSession(date: Date())
        gameSingleton.shared.addSession(GS)
        
        let alert2 = UIAlertController(title: "Неверный ответ, игра закончена",
                                       message: nil,
                                       preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "В главное меню", style: .default) { UIAlertAction in
            self.performSegue(withIdentifier: "exit", sender: nil)
        }
        alert2.addAction(alertAction)
        present(alert2, animated: true, completion: nil)
    }
}

