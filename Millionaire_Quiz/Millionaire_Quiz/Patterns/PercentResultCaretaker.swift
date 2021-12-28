//
//  PercentResultCaretaker.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 27.12.2021.
//

import Foundation

class PercentResultCaretaker {
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let key = "ResultsPercent"
    
    func saveResults(result: [Int]) {
        do {
            let data = try self.encoder.encode(result)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveResults() -> [Int] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try self.decoder.decode([Int].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
