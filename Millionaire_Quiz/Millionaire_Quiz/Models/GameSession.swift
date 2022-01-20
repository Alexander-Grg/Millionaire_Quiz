//
//  GameSession.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 19.12.2021.
//

import Foundation

class GameSession: Codable, GameDelegate  {
    
    var date: Date
    var questionsDelegate: GameDelegate?
    var numberOfAnsweredQuestions: Int = 0
    
    
    func didEndGame(withResult result: Int) {
        self.questionsDelegate?.didEndGame(withResult: result)
        self.numberOfAnsweredQuestions = result
    }
    
    init(date: Date, numberOfAnsweredQuestions: Int) {
        self.date = date
        self.numberOfAnsweredQuestions = numberOfAnsweredQuestions
    }
    
    enum CodingKeys: String, CodingKey {
        case date
        case numberOfAnsweredQuestions
    }
}

