//
//  DinnerGenieViewModel.swift
//  KnowYourselfApp
//
//  Created by 김소희 on 6/11/24.
//

import Foundation

class DinnerGenieViewModel {
    
    private var model = DinnerGenieModel(isDrinking: false, wantsSpicy: false, wantsSoup: false)
    
    var isDrinking: Bool {
        get {
            return model.isDrinking
        }
        set {
            model.isDrinking = newValue
        }
    }
    var wantsSpicy: Bool {
        get {
            return model.wantsSpicy
        }
        set {
            model.wantsSpicy = newValue
        }
    }
    var wantsSoup: Bool {
        get {
            return model.wantsSoup
        }
        set {
            model.wantsSoup = newValue
        }
    }
    
    let questions = ["오늘은 저녁은 술과 함께 한다", "자극적인게 땡긴다", "국물 있는 음식이 먹고싶다"]
    private var currentQuestionIndex = 0
    private var answers = [Bool?](repeating: nil, count: 3)
    
    var isLastQuestion: Bool {
            return currentQuestionIndex == questions.count - 1
        }
    
    var allQuestionsAnswered: Bool {
           return !answers.contains(nil)
       }
    
    var progress: Float {
        let completedQuestions = Float(answers.compactMap { $0 }.count)
        let totalQuestions = Float(questions.count)
        return completedQuestions / totalQuestions
    }
    
    var questionText: String {
        return questions[currentQuestionIndex]
    }
    
    func answerQuestion(answer: Bool) {
        answers[currentQuestionIndex] = answer
        updateUserPreferences(with: answer)
        
        if currentQuestionIndex < questions.count - 1 {
           currentQuestionIndex += 1
        }
    }
    
    private func updateUserPreferences(with answer: Bool) {
        switch currentQuestionIndex {
        case 0:
            model.isDrinking = answer
        case 1:
            model.wantsSpicy = answer
        case 2:
            model.wantsSoup = answer
        default:
            break
        }
    }
    
    var recommendedMenu: String {
        return model.recommendedMenu
    }
}
