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
 
    private var createStrategy: GameModeStrategy {
        switch self.gameMode {
        case .standard:
            
            return StandardGameMode()
        case .random:
            
            return RandomGameMode()
        }
    }
//    private let createModeStrategy: GameModeStrategy
//    fileprivate init(createModeStrategy: GameModeStrategy){
//        self.createModeStrategy = createModeStrategy
//        super.init()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    var questions = [Question]()
    var questionsFromUD = gameSingleton.shared.questions
    var answerNumber = Int()
    var answeredQuestions: Int = 0
    var gameMode: SwitchGameMode = .standard
    weak var gameDelegate: GameDelegate?
    
    
//    private var switchModes: ModeSettings
    
    
//    init(mode: SwitchGameMode) {
//        self.switchModes = ModeSettings(mode: mode)
//        super.init(coder: NSCoder)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    

    
    @IBAction func firstButton(_ sender: Any) {
        if answerNumber == 1 && !questionsFromUD.isEmpty {
            answeredQuestions += 1
            
            createStrategy.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
          
//            randomGame.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
        } else if questionsFromUD.isEmpty {
            gameFinished()
        } else {
            wrongAnswer()
        }
    }
    @IBAction func secondButton(_ sender: Any) {
        if answerNumber == 2 && !questionsFromUD.isEmpty {
            answeredQuestions += 1

            createStrategy.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
//            randomGame.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
        } else if questionsFromUD.isEmpty {
            gameFinished()
        } else {
            wrongAnswer()
        }
    }
    @IBAction func thirdButton(_ sender: Any) {
        if answerNumber == 3 && !questionsFromUD.isEmpty {
            answeredQuestions += 1
            createStrategy.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
//            randomGame.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
        } else if questionsFromUD.isEmpty {
            gameFinished()
        } else {
            wrongAnswer()
        }
    }
    @IBAction func fourthButton(_ sender: Any) {
        if answerNumber == 4 && !questionsFromUD.isEmpty {
            answeredQuestions += 1
            createStrategy.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
//            randomGame.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
        } else if questionsFromUD.isEmpty {
            gameFinished()
        } else {
            wrongAnswer()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        randomGame.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
        createStrategy.questionPicker(questions: &questionsFromUD, buttons: Buttons, label: questionLabel, answerNumber: &answerNumber)
        
    }
    
    private func wrongAnswer() {
        //        self.gameDelegate?.didEndGame(withResult: answeredQuestions)
        let alert2 = UIAlertController(title: "Incorrect answer, the game is finished",
                                       message: nil,
                                       preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "To the main menu", style: .default) { [self] UIAlertAction in
            //            self.performSegue(withIdentifier: "exit", sender: nil)
            let session = GameSession(date: Date(), numberOfAnsweredQuestions: self.answeredQuestions)
            self.gameDelegate?.didEndGame(withResult: self.answeredQuestions)
            //            gameSingleton.shared.percentOfAnsweredQuestions(result: answeredQuestions)
            gameSingleton.shared.percentOfAnsweredQuestions(result: session)
            gameSingleton.shared.addSession(session)
            
        }
        alert2.addAction(alertAction)
        present(alert2, animated: true, completion: nil)
    }
    
    private func gameFinished() {
        answeredQuestions += 1
        NSLog("done")
        
        let winningAlert = UIAlertController(title: "You won, all questions are correct!",
                                             message: nil,
                                             preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "To the main menu",
                                        style: .default) { UIAlertAction in
            let session = GameSession(date: Date(), numberOfAnsweredQuestions: self.answeredQuestions)
            self.gameDelegate?.didEndGame(withResult: self.answeredQuestions)
            //                gameSingleton.shared.percentOfAnsweredQuestions(result: self.answeredQuestions)
            gameSingleton.shared.percentOfAnsweredQuestions(result: session)
            gameSingleton.shared.addSession(session)
            //
        }
        winningAlert.addAction(alertAction)
        present(winningAlert, animated: true, completion: nil)
    }
    
}

extension GameFlowViewController: GameDelegate {
    func didEndGame(withResult result: Int) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


