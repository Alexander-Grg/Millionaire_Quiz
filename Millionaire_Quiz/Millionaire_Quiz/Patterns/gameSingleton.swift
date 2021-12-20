//
//  gameSingleton.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 19.12.2021.
//

import Foundation

final class gameSingleton {
    
    static let shared = gameSingleton()
    private let resultsCaretaker = ResultsCareTaker()
    
    private(set) var gameSession: [GameSession] {
        didSet {
            resultsCaretaker.saveResults(result: self.gameSession)
        }
    }
    
    func addSession(_ session: GameSession) {
        self.gameSession.append(session)
    }
    
    func clearSession() {
        self.gameSession = []
    }
    private  init(){
        self.gameSession = self.resultsCaretaker.retrieveResults()
    }
}

//To create PR
