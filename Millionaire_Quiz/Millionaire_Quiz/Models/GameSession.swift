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
    
    
    func didEndGame(withResult result: Int) {
        self.questionsDelegate?.didEndGame(withResult: result)
    }
    
    init(date: Date) {
        self.date = date
    }
    
    enum CodingKeys: String, CodingKey {
        case date
    }
}




