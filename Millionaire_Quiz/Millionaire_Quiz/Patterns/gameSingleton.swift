//
//  gameSingleton.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 19.12.2021.
//

import Foundation
import UIKit

final class gameSingleton {
    
    static let shared = gameSingleton()
    private let resultsCaretaker = ResultsCareTaker()
    private let questionsCareTaker = QuestionsCaretaker()
    private let resultPercentCaretaker = PercentResultCaretaker()
//    private let gameModeCareTaker =
    private(set) var gameS: GameSession?
//    private(set) var gameMode: [GameModeStrategy] {
//        didSet {
//            
//        }
//    }
    private(set) var questions: [Question] {
        didSet {
            questionsCareTaker.saveResults(result: self.questions)
        }
    }
    
    private(set) var resultPercent = [Int]() {
        didSet {
            resultPercentCaretaker.saveResults(result: self.resultPercent)
        }
    }
    
    private(set) var gameSession: [GameSession] {
        didSet {
            resultsCaretaker.saveResults(result: self.gameSession)
        }
    }
    
    func addSession(_ session: GameSession) {
        self.gameSession.append(session)
    }
    
    func addQuestions(_ questions: Question) {
        self.questions.append(questions)
    }
    
    func addResultPercent(_ result: Int) {
        self.resultPercent.append(result)
    }
    
    func clearSession() {
        self.gameSession = []
    }
    
    func percentOfAnsweredQuestions(result: GameSession) {
        
        let totalNumberOfQuestions = Float(gameSingleton.shared.questions.count)
        let answers = Float(result.numberOfAnsweredQuestions)
        let percentageCounting: Float = Float(answers/totalNumberOfQuestions)
        let percent: Int = Int(Float(percentageCounting) * Float(100))
        resultPercent.append(percent)
    }
    
    private init(){
//        self.gameMode = gameMode()
        self.gameSession = self.resultsCaretaker.retrieveResults()
        self.questions = self.questionsCareTaker.retrieveResults()
        self.resultPercent = self.resultPercentCaretaker.retrieveResults()
    }
}

