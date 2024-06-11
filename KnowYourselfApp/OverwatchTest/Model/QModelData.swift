//
//  QModelData.swift
//  KnowYourselfApp
//
//  Created by 김형준 on 6/11/24.
//

import Foundation

struct QModelData {
    var question: String
    var anwser1: String
    var anwser2: String
    var anwser3: String
    var anwser4: String
    
    init(question: String, anwser1: String, anwser2: String, anwser3: String, anwser4: String) {
        self.question = question
        self.anwser1 = anwser1
        self.anwser2 = anwser2
        self.anwser3 = anwser3
        self.anwser4 = anwser4
    }
}

var questions: [String :QModelData] = [
    "tanker1" : QModelData(question: """
                           당신은 소중한 사람과 길을 걷고있다. 그런데 갑자기 나와 비슷한 체력의 괴한이 당신의 일행에게 발길질을 하는데!
                           이때 당신은 어떻게 할 것인가
                           """,
                           anwser1: "눈에는 눈, 이에는 이! 순간적으로 나도 발로 차버린다",
                           anwser2: "안돼! 발을 막으려고 한다",
                           anwser3: "뭐하시는거에요! 일행을 살피며 말로 따진다",
                           anwser4: "답변4"),
    "tanker2" : QModelData(question: """
바로 경찰에 신고했지만 그 사람은 도망갔습니다.
가장 먼저 드는 생각은?
""",
                           anwser1: "그 사람에 대한 분노가 끓어오른다",
                           anwser2: "아 막았어야 하는데",
                           anwser3: "일행이 어디 안다쳤나 걱정된다",
                           anwser4: ""),
    "tanker3" : QModelData(question: """
같은 날 당신은 그 괴한을 다시 만나게 됩니다.
어떻게 하시겠습니까?
""",
                           anwser1: "가서 잡는다",
                           anwser2: "또 이상한 짓을 할지도 모르니 예의주시한다",
                           anwser3: "더럽고 위험하니 피한다",
                           anwser4: "")
]

