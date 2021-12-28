//
//  QuestionStructure.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 18.12.2021.
//

import Foundation


struct Question: Codable {
    
    var question: String!
    var answers: [String]!
    var correctAnswer: Int!
}


