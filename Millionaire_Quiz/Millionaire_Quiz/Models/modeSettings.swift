//
//  modeSettings.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 21.12.2021.
//

import Foundation

class ModeSettings {
    
    var mode: SwitchGameMode
    
    private lazy var createModeStrategy: GameModeStrategy =  {
        switch self.mode {
        case .random:
            return RandomGameMode()
        case .standard:
            return StandardGameMode()
        }
    }()
    
    init(mode: SwitchGameMode) {
        self.mode = mode
    }
    
    
}
