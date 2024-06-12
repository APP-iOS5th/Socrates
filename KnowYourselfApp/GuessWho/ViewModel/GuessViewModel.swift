//
//  GuessViewModel.swift
//  KnowYourselfApp
//
//  Created by seokyung on 6/4/24.
//

import Foundation

class GuessViewModel {
    private var quizNo: Int = 0
    private let quizList: [QuizModel]
    var selectedAnswerIndex: Int?
    
    private var scores: [String: Int] = [:]
    private var answers: [Int: Int] = [:]
    private var tempAnswers: [Int: Int] = [:]
    
    var totalQuizCount: Int {
        return quizList.count
    }
    
    var currentQuestion: QuizModel {
        return quizList[quizNo]
    }
    
    var progress: Float {
        return Float(quizNo) / Float(totalQuizCount)
    }
    
    var isLastQuestion: Bool {
        return quizNo == totalQuizCount - 1
    }
    
    var currentQuizNo: Int {
        return quizNo
    }
    
    init(quizList: [QuizModel]) {
        self.quizList = quizList
    }
    
    func moveToNextQuestion() -> Bool {
        guard let selectedIndex = selectedAnswerIndex else { return false }
        if let tempIndex = tempAnswers[quizNo] {
            updateScores(for: tempIndex, isAdding: false)
        }
        answers[quizNo] = selectedIndex
        tempAnswers[quizNo] = selectedIndex // 선택한 값을 임시 저장소에 저장
        updateScores(for: selectedIndex, isAdding: true)
        quizNo += 1
        selectedAnswerIndex = answers[quizNo]
        return true
    }
    
    func moveToPreviousQuestion() {
        guard quizNo > 0 else { return }
        
        if let tempAnswerIndex = tempAnswers[quizNo] {
            updateScores(for: tempAnswerIndex, isAdding: false)
            tempAnswers.removeValue(forKey: quizNo) // 임시 저장소에서 값 제거
        }
        
        quizNo -= 1
        selectedAnswerIndex = answers[quizNo]
    }
    
    func updateScores(for answerIndex: Int, isAdding: Bool) {
        let people = getPeople(for: quizNo + 1, answerIndex: answerIndex)
        for person in people {
            scores[person, default: 0] += isAdding ? 1 : -1
        }
    }
    
    func getPeople(for questionNumber: Int, answerIndex: Int) -> [String] {
        switch questionNumber {
        case 1:
            switch answerIndex {
            case 0: return ["김진웅", "만두쌤", "튜나쌤", "명섭쌤"]
            case 1: return ["권도율", "송주현", "정희지", "홍준범", "석지혜"]
            case 2: return ["이인호", "황규상"]
            default: return []
            }
        case 2:
            switch answerIndex {
            case 0: return ["김진웅", "만두쌤", "이인호","명섭쌤", "권도율"]
            case 1: return ["황규상", "송주현", "석지혜", "정희지", "명섭쌤", "권도율", "김진웅"]
            case 2: return ["홍준범", "튜나쌤"]
            default: return []
            }
        case 3:
            switch answerIndex {
            case 0: return ["석지혜", "튜나쌤"]
            case 1: return ["정희지", "송주현", "황규상", "이인호", "김진웅", "권도율", "명섭쌤", "홍준범"]
            case 2: return ["만두쌤", "김진웅", "명섭쌤", "홍준범"]
            default: return []
            }
        case 4:
            switch answerIndex {
            case 0: return ["이인호", "만두쌤", "튜나", "명섭쌤"]
            case 1: return ["황규상", "튜나", "명섭쌤"]
            case 2: return ["석지혜", "권도율", "송주현", "정희지", "김진웅", "홍준범"]
            default: return []
            }
        case 5:
            switch answerIndex {
            case 0: return ["황규상", "석지혜"]
            case 1: return ["만두쌤", "튜나쌤", "김진웅", "홍준범", "송주현", "이인호", "권도율"]
            case 2: return ["정희지", "튜나쌤", "김진웅", "권도율"]
            default: return []
            }
        case 6:
            switch answerIndex {
            case 0: return ["만두쌤", "튜나쌤", "김진웅", "홍준범"]
            case 1: return ["명섭쌤", "권도율", "이인호"]
            case 2: return ["정희지", "송주현", "석지혜", "황규상"]
            default: return []
            }
        case 7:
            switch answerIndex {
            case 0: return ["만두쌤"]
            //case 1: return []
            //case 2: return []
            default: return []
            }
        case 8:
            switch answerIndex {
            case 0: return ["송주현", "정희지", "황규상", "권도율", "김진웅", "튜나쌤", "만두쌤", "홍준범"]
            case 1: return ["이인호", "석지혜", "명섭쌤"]
            case 2: return ["이인호"]
            default: return []
            }
        case 9:
            switch answerIndex {
            case 0: return ["김진웅", "석지혜"]
            case 1: return ["권도율", "명섭쌤", "정희지", "송주현", "황규상", "이인호"]
            case 2: return ["만두쌤", "튜나쌤", "홍준범"]
            default: return []
            }
        default:
            return []
        }
    }
    
    func getResult() -> (name: String, imageName: String)? {
        guard let topPerson = scores.max(by: { $0.value < $1.value }) else { return nil }
        if let person = personList.first(where: { $0.name == topPerson.key }) {
            return (name: person.name, imageName: person.imageName)
        }
        return nil
    }
}
