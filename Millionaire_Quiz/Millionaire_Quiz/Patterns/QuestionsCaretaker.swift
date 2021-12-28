//
//  QuestionsCaretaker.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 23.12.2021.
//

import Foundation

class QuestionsCaretaker {
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let key = "Questions"
    
    func saveResults(result: [Question]) {
        do {
            let data = try self.encoder.encode(result)
            UserDefaults.standard.set(data, forKey: key)
            print(result)
        } catch {
            print(error)
        }
    }
    
    func retrieveResults() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try self.decoder.decode([Question].self, from: data)
            
        } catch {
            print(error)
            return []
        }
    }
    
}

extension UserDefaults {
    
    enum Keys: String, CaseIterable {
        
        case Questions
        case Results
        case ResultsPercent
    }
    
    func reset() {
        
        Keys.allCases.forEach { removeObject(forKey: $0.rawValue) }
    }
    
}
