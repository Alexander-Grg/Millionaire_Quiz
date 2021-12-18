//
//  GameFlowViewController.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 18.12.2021.
//

import UIKit

class GameFlowViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    @IBAction func unwindToMainMenu(sender: UIStoryboardSegue) {}
    @IBAction func firstButton(_ sender: Any) {
        gameLogic()
    }
    @IBAction func secondButton(_ sender: Any) {
        gameLogic()
    }
    @IBAction func thirdButton(_ sender: Any) {
        gameLogic()
    }
    @IBAction func fourthButton(_ sender: Any) {
        gameLogic()
    }
    
    var questions = [Question]()
    var questionNumber = Int()
    var answerNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questions = [
            Question(question: "Who is the president of Russia", answers: ["Will Smith", "Bruce Li", "Vladimir Putin", "Barack Obama"], correctAnswer: 3),
            Question(question: "Who won the first oscar as the best actor", answers: ["Emil Jannings","Janet Gaynor","Charlie Chaplin","Karl Struss"], correctAnswer: 1),
            Question(question: "SomeQuestion", answers: ["","","",""], correctAnswer: 1)
        ]
    }

    func questionPicker() {
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
        }
    }
    
    func gameLogic() {
        if answerNumber == questions[questionNumber].correctAnswer {
            questionPicker()
        } else {
            let alert = UIAlertController(title: "Неверный ответ, игра закончена",
                                          message: nil,
                                          preferredStyle: .alert)
            present(alert, animated: true, completion: nil)
            func unwindToMainMenu(sender: UIStoryboardSegue) {}
            
        }
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        return
    }
   
}
