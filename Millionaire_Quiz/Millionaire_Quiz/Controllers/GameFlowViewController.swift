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
    
    @IBAction func gameExit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet var answersLabel: UILabel!
    let totalQuestions = gameSingleton.shared.questions.count
    
    private var createStrategy: GameModeStrategy {
        switch self.gameMode {
        case .standard:
            return StandardGameMode()
        case .random:
            return RandomGameMode()
        }
    }
    
    var questionsFromUD = gameSingleton.shared.questions
    var answerNumber = Int()
    var answeredQuestions = Observable<Int>(0)
    var gameMode: SwitchGameMode = .standard
    weak var gameDelegate: GameDelegate?
    
    @IBAction func firstButton(_ sender: Any) {
        if answerNumber == 1 && !questionsFromUD.isEmpty {
            answeredQuestions.value += 1
            
            createStrategy.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
        } else if questionsFromUD.isEmpty {
            gameFinished()
        } else {
            wrongAnswer()
        }
    }
    @IBAction func secondButton(_ sender: Any) {
        if answerNumber == 2 && !questionsFromUD.isEmpty {
            answeredQuestions.value += 1
            
            createStrategy.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
        } else if questionsFromUD.isEmpty {
            gameFinished()
        } else {
            wrongAnswer()
        }
    }
    @IBAction func thirdButton(_ sender: Any) {
        if answerNumber == 3 && !questionsFromUD.isEmpty {
            answeredQuestions.value += 1
            createStrategy.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
        } else if questionsFromUD.isEmpty {
            gameFinished()
        } else {
            wrongAnswer()
        }
    }
    @IBAction func fourthButton(_ sender: Any) {
        if answerNumber == 4 && !questionsFromUD.isEmpty {
            answeredQuestions.value += 1
            createStrategy.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
            
        } else if questionsFromUD.isEmpty {
            gameFinished()
        } else {
            wrongAnswer()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answeredQuestions.addObserver(self, options: [.new, .initial]) { [weak self] (answers, _) in
            
            let percent1 = self?.percentageOfAnswers(answer: answers)
            self?.answersLabel.text = "Correct answers \(answers) out of \(gameSingleton.shared.questions.count) (Completed \(percent1 ?? 0)%) "
        }
        
        createStrategy.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
        
        
    }
    
    private func wrongAnswer() {
        let alert2 = UIAlertController(title: "Incorrect answer, the game is finished",
                                       message: nil,
                                       preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "To the main menu", style: .default) { [self] UIAlertAction in
            let session = GameSession(date: Date(), numberOfAnsweredQuestions: self.answeredQuestions.value)
            self.gameDelegate?.didEndGame(withResult: self.answeredQuestions.value)
            gameSingleton.shared.percentOfAnsweredQuestions(result: session)
            gameSingleton.shared.addSession(session)
            
        }
        alert2.addAction(alertAction)
        present(alert2, animated: true, completion: nil)
    }
    
    private func gameFinished() {
        answeredQuestions.value += 1
        NSLog("done")
        
        let winningAlert = UIAlertController(title: "You won, all questions are correct!",
                                             message: nil,
                                             preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "To the main menu",
                                        style: .default) { UIAlertAction in
            let session = GameSession(date: Date(), numberOfAnsweredQuestions: self.answeredQuestions.value)
            self.gameDelegate?.didEndGame(withResult: self.answeredQuestions.value)
            gameSingleton.shared.percentOfAnsweredQuestions(result: session)
            gameSingleton.shared.addSession(session)
            
        }
        winningAlert.addAction(alertAction)
        present(winningAlert, animated: true, completion: nil)
    }
    
    
    private func percentageOfAnswers(answer: Int?) -> Int {
        
        let questionFloat = Float(answer ?? 0)
        let totalQuestionsFloat = Float(totalQuestions)
        let percent = (questionFloat/totalQuestionsFloat) * 100
        if percent > 0 {
            return Int(percent)
        } else {
            return 0
        }
    }
    
}

extension GameFlowViewController: GameDelegate {
    func didEndGame(withResult result: Int) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


