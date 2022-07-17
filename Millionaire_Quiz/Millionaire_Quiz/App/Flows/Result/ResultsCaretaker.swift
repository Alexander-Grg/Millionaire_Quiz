//
//  ResultsCaretaker.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 20.12.2021.
//

import Foundation

class ResultsCareTaker {
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let key = "Results"
    
    func saveResults(result: [GameSession]) {
        do {
            let data = try self.encoder.encode(result)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveResults() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try self.decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
