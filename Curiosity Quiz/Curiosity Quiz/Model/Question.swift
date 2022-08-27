//
//  Question.swift
//  Curiosity Quiz
//
//  Created by Furkan on 27.08.2022.
//

import Foundation

struct Question{
    let question: String;
    let answer: [String];
    let correctAnswer : String;
    
    init(q:String, a:[String], correctAnswer:String){
        self.question = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
    
    
}
