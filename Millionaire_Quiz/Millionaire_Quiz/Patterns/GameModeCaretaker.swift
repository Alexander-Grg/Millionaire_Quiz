//
//  GameModeCaretaker.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 12.01.2022.
//

import Foundation

//class GameModeCaretaker {
//
//    let encoder = JSONEncoder()
//    let decoder = JSONDecoder()
//    let key = "GameMode"
//
//    func saveResults(result: [SwitchGameMode]) {
//        do {
//            let data = try self.encoder.encode(result)
//            UserDefaults.standard.set(data, forKey: key)
//        } catch {
//            print(error)
//        }
//    }
//
//    func retrieveResults() -> [SwitchGameMode] {
//        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
//        do {
//            return try self.decoder.decode([SwitchGameMode].self, from: data)
//        } catch {
//            print(error)
//            return []
//        }
//    }
//}
