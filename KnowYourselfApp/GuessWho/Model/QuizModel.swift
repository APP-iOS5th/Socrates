// QuizModel.swift

import Foundation

struct QuizModel {
    let question: String
    let answerOne: String
    let answerTwo: String
    let answerThree: String
}

let quizList: [QuizModel] = [
    QuizModel(question: "수업 중 약간 어려운 개념이 나왔다\n나는...", answerOne: "이미 알고있다! 수강생들을 돕는다", answerTwo: "채팅창으로 도움을 요청한다", answerThree: "챗지피티에게 도움을 요청한다"),
    QuizModel(question: "만두쌤이 화면공유를 깜빡하셨다\n나는...", answerOne: "누군가 말해주길 기다린다", answerTwo: "채팅창으로 열심히 불러본다", answerThree: "마이크 켜고 말씀드린다"),
    QuizModel(question: "채팅창에 올라온 💩개그\n당신의 반응은?", answerOne: "내가 보낸 채팅이다😎", answerTwo: "ㅋㅋㅋㅋㅋ웃기다!", answerThree: "흐린눈…😑"),
    QuizModel(question: "나는 만두쌤을 실제로", answerOne: "자주 봤다", answerTwo: "본 적은 있다", answerThree: "본 적 없다"),
    QuizModel(question: "번개모임이 열렸다 나는...", answerOne: "빠질 수 없지 또 참석한다", answerTwo: "나는 집에서도 할 일이 많다!", answerThree: "번개 장소가 너무 멀다..ㅠ 강제불참"),
    QuizModel(question: "아프다던 팀원이 오늘 출석하지 않았다!\n나는...", answerOne: "왜 안 오지? 사정이 있겠지 뭐", answerTwo: "많이 아프신가?ㅜㅜㅠㅠ", answerThree: "팀 채팅방에 태그해서 불러본다"),
    QuizModel(question: "더운 여름, 점심먹고 카페에 왔다!\n나의 선택은?", answerOne: "아이스아메리카노", answerTwo: "따뜻한 커피", answerThree: "과일음료"),
    QuizModel(question: "팀원끼리의 실습시간!\n처음 모이는 자리에서 나는...", answerOne: "주도적으로 대화를 이끌어간다!", answerTwo: "주로 대답을 하는 편이다", answerThree: "웬만한 답변은 이모지 사용을 선호한다"),
    QuizModel(question: "만두쌤이 아아를 드시며 기침을 하신다\n이때 나는...", answerOne: "차가운 음료 그만 드세요!", answerTwo: "목 상태 괜찮으신가요ㅜㅠㅜ", answerThree: "아아와 기침은 상관이 없다!")
]

struct PersonModel {
    let name: String
    let imageName: String
}


let personList: [PersonModel] = [
    PersonModel(name: "만두쌤", imageName: "mandu"),
    PersonModel(name: "튜나쌤", imageName: "tuna"),
    PersonModel(name: "석지혜", imageName: "jihye"),
    PersonModel(name: "권도율", imageName: "doyul"),
    PersonModel(name: "명섭쌤", imageName: "myungseob"),
    PersonModel(name: "김진웅", imageName: "jinwoong"),
    PersonModel(name: "황규상", imageName: "gyusang"),
    PersonModel(name: "홍준범", imageName: "junbeom"),
    PersonModel(name: "이인호", imageName: "inho"),
    PersonModel(name: "송주현", imageName: "juhyun"),
    PersonModel(name: "정희지", imageName: "heeji")
]
