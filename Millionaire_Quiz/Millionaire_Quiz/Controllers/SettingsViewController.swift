//
//  SettingsTableViewController.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 21.12.2021.
//

import Foundation
import UIKit



class SettingsViewController: UIViewController {
    
    @IBOutlet var switchMode: UISwitch!
    @IBAction func addCustomQuestion(_ sender: Any) {
        addQuestions()
    }
    
    @IBAction func addStandard(_ sender: Any) {
        addStandardQuestions()
        alertOfStandardQuestions()
    }
    @IBAction func deleteQuestions(_ sender: Any) {
        UserDefaults.standard.reset()
        alertOfCancel()
    }
    var selectedState: SwitchGameMode {
        if switchMode.isOn == true {
            return .random
        } else {
            return .standard
        }
    }
    
    private func addStandardQuestions() {
        let question1 = Question(question: "Who is the president of Russia?", answers: ["Will Smith", "Bruce Li", "Vladimir Putin", "Barack Obama"], correctAnswer: 3)
        let question2 = Question(question: "Who won the first oscar as the best actor?", answers: ["Emil Jannings","Janet Gaynor","Charlie Chaplin","Karl Struss"], correctAnswer: 1)
        let question3 = Question(question: "What is the capital of Chile?", answers: ["Santiago","Melipilla","San Antonio","Melbourne"], correctAnswer: 1)
        let question4 = Question(question: "What is the highest mountain in Britain?", answers: ["Snowdon","Scafell Pike","Ben Nevis","Everest"], correctAnswer: 2)
        let question5 = Question(question: "How many players are there in a rugby league team?", answers: ["22","16","7","13"], correctAnswer: 4)
        let question6 = Question(question: "What is Japanese sake made from?", answers: ["Berries","Corn","Rice","Wheat"], correctAnswer: 3)
        let question7 = Question(question: "What is the capital of Westeros in Game of Thrones?", answers: ["Riverrun","King’s Landing","Pyke","Casterly Rock"], correctAnswer: 2)
        
        gameSingleton.shared.addQuestions(question1)
        gameSingleton.shared.addQuestions(question2)
        gameSingleton.shared.addQuestions(question3)
        gameSingleton.shared.addQuestions(question4)
        gameSingleton.shared.addQuestions(question5)
        gameSingleton.shared.addQuestions(question6)
        gameSingleton.shared.addQuestions(question7)
        
    }
    
    private func alertOfStandardQuestions() {
        let alertController = UIAlertController(title: "Standard questions were added",
                                                message: nil,
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok",
                               style: .cancel,
                               handler: nil)
        
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
    private func alertOfCancel() {
        let alertController = UIAlertController(title: "All questions were deleted",
                                                message: nil,
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok",
                               style: .cancel,
                               handler: nil)
        
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
    
    private func addQuestions() {
        let alertController = UIAlertController(title: "Adding a user questions",
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField { UITextField in
            UITextField.placeholder = "Enter your question"
            
        }
        alertController.addTextField { UITextField in
            UITextField.placeholder = "First answer"
        }
        alertController.addTextField { UITextField in
            UITextField.placeholder = "Second answer"
        }
        alertController.addTextField { UITextField in
            UITextField.placeholder = "Third answer"
        }
        alertController.addTextField { UITextField in
            UITextField.placeholder = "Forth answer"
        }
        alertController.addTextField { UITextField in
            UITextField.placeholder = "Correct answer number"
        }
        
        
        let enter = UIAlertAction(title: "Confirm", style: .default) { UIAlertAction in
            guard let textField1 = alertController.textFields?[0],
                  let textFieldQ1 = alertController.textFields?[1],
                  let textFieldQ2 = alertController.textFields?[2],
                  let textFieldQ3 = alertController.textFields?[3],
                  let textFieldQ4 = alertController.textFields?[4],
                  let correctAnswerNumber = alertController.textFields?[5],
                  
                    let enterQuestion = textField1.text,
                  let answer1 = textFieldQ1.text,
                  let answer2 = textFieldQ2.text,
                  let answer3 = textFieldQ3.text,
                  let answer4 = textFieldQ4.text,
                  let correctAnswer = correctAnswerNumber.text,
                  
                    !enterQuestion.isEmpty,
                  !answer1.isEmpty,
                  !answer2.isEmpty,
                  !answer3.isEmpty,
                  !answer4.isEmpty,
                  !correctAnswer.isEmpty
                    
            else { return }
            
            var sumOfAnswers: [String] = []
            sumOfAnswers.append(answer1)
            sumOfAnswers.append(answer2)
            sumOfAnswers.append(answer3)
            sumOfAnswers.append(answer4)
            
            let questionSave = Question(question: enterQuestion, answers: sumOfAnswers, correctAnswer: Int(correctAnswer))
            gameSingleton.shared.addQuestions(questionSave)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(enter)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
