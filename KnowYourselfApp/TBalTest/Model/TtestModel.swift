//
//  TtestModel.swift
//  KnowYourselfApp
//
//  Created by SeongKook on 6/3/24.
//

import Foundation

class Ttest: Identifiable {
    var id: UUID = UUID()
    var questionAsk: String
    var questions: [TtestList]
    
    init(questionAsk: String, questions: [TtestList]) {
        self.questionAsk = questionAsk
        self.questions = questions
    }
}

struct TtestList {
    let content: String
    let score: Int
}



