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
    var anwser3: String?
    var anwser4: String?
    
    init(question: String, anwser1: String, anwser2: String, anwser3: String?, anwser4: String?) {
        self.question = question
        self.anwser1 = anwser1
        self.anwser2 = anwser2
        self.anwser3 = anwser3
        self.anwser4 = anwser4
    }
}

var questions: [String :QModelData] = [
        "main" : QModelData(question: """
                               당신은 소중한 사람과 길을 걷고있다. 그런데 갑자기 나와 비슷한 체력의 괴한이 당신의 일행에게 발길질을 하는데!
                               이때 당신은 어떻게 할 것인가
                               """,
                               anwser1: "눈에는 눈, 이에는 이! 순간적으로 나도 발로 차버린다",
                               anwser2: "안돼! 발을 막으려고 한다",
                               anwser3: "뭐하시는거에요! 일행을 살피며 말로 따진다",
                               anwser4: "dd"),
        "main1" : QModelData(question: """
                               바로 경찰에 신고했지만 그 사람은 도망갔습니다.
                               가장 먼저 드는 생각은?
                               """,
                               anwser1: "그 사람에 대한 분노가 끓어오른다",
                               anwser2: "아 막았어야 하는데",
                               anwser3: "일행이 어디 안다쳤나 걱정된다",
                               anwser4: nil),
        "main2" : QModelData(question: """
                               같은 날 당신은 그 괴한을 다시 만나게 됩니다.
                               어떻게 하시겠습니까?
                               """,
                               anwser1: "가서 잡는다",
                               anwser2: "또 이상한 짓을 할지도 모르니 예의주시한다",
                               anwser3: "더럽고 위험하니 피한다",
                               anwser4: nil),
        "tanker" : QModelData(question: """
                               여행 중 예기치 않은 상황이 발생했습니다. 당신의 반응은 무엇인가요?
                               """,
                               anwser1: "미리 준비해 둔 대안 계획을 실행한다" ,//진영유지
                               anwser2: "동행자들과 협력하여 최선의 해결책을 찾는다",//밀당
                               anwser3: "상황을 즐기며 새로운 모험으로 받아들인다", //다이브
                               anwser4: nil),
        "tanker0" : QModelData(question: """
                               팀 프로젝트에서 리더를 맡은 당신, 당신은 어떤 리더입니까?
                               """,
                               anwser1: "체계적이고 논리적인 접근을 통해 문제를 해결합니다. 팀원들에게 지적인 자극을 줍니다",//(시그마),
                               anwser2: "팀을 보호하고 이끌며, 필요한 경우 적극적으로 문제를 해결합니다",//라인
                               anwser3: "강한 체력과 결단력으로 팀을 이끕니다. 팀원들에게 힘을 북돋아 주고, 어려운 작업을 도맡습니다", //자랴
                               anwser4: "마지막질문입니다. 패스하고 다음 질문지로 넘어갈 수 있습니다"),//패스
        "tanker03" : QModelData(question: """
                               여가 시간에 가장 즐기는 활동은 무엇인가요?
                               """,
                               anwser1: "새로운 것을 탐구하거나 과학적인 지식을 넓힌다",//시그마
                               anwser2: "음악을 듣거나 문화생활을 즐긴다",//라인
                               anwser3: "강도 높은 웨이트 트레이닝을 하는 헬창이다",//자랴
                               anwser4: nil),
        "tanker1" : QModelData(question: """
                               인생을 바라보는 당신의 시각은 무엇인가요?
                               """,
                               anwser1: "인생은 강한 자가 살아남는 곳이며, 실력을 키우고 경쟁에서 승리하는 것이 중요하다.",//퀸
                               anwser2: "인생은 조화와 평화가 중요하며, 서로 도우며 살아가는 것이 중요하다.",//오리사
                               anwser3: "인생은 맛있는 음식을 먹고, 즐기는 것이 가장 중요하며, 생존과 만족이 최우선이다.",//로드호그
                               anwser4: nil),
        "tanker2" : QModelData(question: """
                               다음중 한가지 활동을 해야합니다. 어떤 활동을 하시겠습니까?
                               """,
                               anwser1: "동물 유튜브를 보거나 집에서 뒹굴거린다",//래킹
                               anwser2: "복싱 경기를 보거나 운동을 한다",//둠
                               anwser3: "과학영상을 보거나 탐구적 활동",//윈스턴
                               anwser4: "고인물이 가득한 경쟁 게임하기"),//디바
        "dps" : QModelData(question: """
                               당신은 작업할 때, 어떤 작업 스타일이 가장 잘 맞는 것 같나요?
                               """,
                               anwser1: "새로운 아이디어를 시도하고 창의적 도전하는 것이 좋아요. ",//dps0
                               anwser2: "안정적으로 꾸준히 일하는 것을 선호합니다.",//dps1
                               anwser3: "집중력을 발휘하여 강력한 한 방이 중요합니다. ",//dps2
                               anwser4: nil),
        "dps0" : QModelData(question: """
                               당신이 가장 중요하게 생각하는 가치는 무엇인가요?
                               """,
                               anwser1: "이상적인 사회적 정의와 평등이 가장 중요합니다.", // (시메, 파라 그룹)",
                               anwser2: "자신의 능력을 단련하여 최고의 결과물을 만들고자 합니다.", // (겐지, 트레, 솜브라 그룹)",
                               anwser3: "과학과 학문적 탐구를 중요하게 생각합니다.", // (메이, 벤쳐 그룹)",
                               anwser4: nil),
        "dps00" : QModelData(question: """
                               다음 중 어떤 체험을 하고 싶습니까?
                               """,
                               anwser1: "가상현실 증강현실 체험", //(시메)",
                               anwser2: "아이언맨 같은 강화슈트 체험", //(파라)",
                               anwser3: nil,
                               anwser4: nil),
        "dps01" : QModelData(question: """
                               당신은 어떤 상상을 자주 하십니까?
                               """,
                               anwser1: "알고보니 엄청 난 신체능력을 지닌 상상", //(겐지)",
                               anwser2: "시간을 조종하는 상상", //(트레)",
                               anwser3: "남들의 비밀 다 알게되는 상상", //(솜브라)",
                               anwser4: nil),
        "dps02" : QModelData(question: """
                               다음중 당신을 설레게 하는것은?
                               """,
                               anwser1: "새로운 발명", //(메이)",
                               anwser2: "새로운 발견", //(벤쳐)",
                               anwser3: nil,
                               anwser4: nil),
        "dps1" : QModelData(question: """
                               게임의 승리를 위해서 어떻게 플레이하고싶으신가요?
                               """,
                               anwser1: "중간은 가게 플레이한다", //(솔져, 소전, 바스)",
                               anwser2: "쉽게 꿀빨면서 이기고싶다", //(바스, 톨비)",
                               anwser3: "상대팀을 괴롭혀서 이기고싶다", //(리퍼, 정크)",
                               anwser4: nil),
        "dps10" : QModelData(question: """
                               당신의 성별은 무엇인가요?
                               """,
                               anwser1: "남성", //(솔져)",
                               anwser2: "여성", //(소전)",
                               anwser3: "그 외", //(바스)",
                               anwser4: nil),
        "dps11" : QModelData(question: """
                               당신에게 가까운 키워드는?
                               """,
                               anwser1: "반려동물, 자연, 평화", //(바스)",
                               anwser2: "공대생, 기술자, 가정적", //(톨비)",
                               anwser3: nil,
                               anwser4: nil),
        "dps12" : QModelData(question: """
                               피곤할때 당신의 모습은 어떤가요?
                               """,
                               anwser1: "죽은사람같이 움직인다.", // (리퍼)",
                               anwser2: "반쯤 정신이 미친다.", //(정크렛)",
                               anwser3: nil,
                               anwser4: nil),
        "dps2" : QModelData(question: """
                               당신에게 가까운 모습
                               """,
                               anwser1: "멋과 여유 그리고 정진!", // (캐서디, 한조)",
                               anwser2: "다소 건방진 실력자.", //(위도우, 애쉬)",
                               anwser3: nil,
                               anwser4: nil),
        "dps20" : QModelData(question: """
                               당신은 어떤 스타일에 가깝습니까?
                               """,
                               anwser1: "독고다이", // (캐서디)",
                               anwser2: "든든한 집안", // (한조)",
                               anwser3: nil,
                               anwser4: nil),
        "dps21" : QModelData(question: """
                               다음중 갖고싶은 물건은?
                               """,
                               anwser1: "뭐든 투시하는 안경", // (위도우)",
                               anwser2: "휴머노이드 로봇", //(애쉬)",
                               anwser3: nil,
                               anwser4: nil),
        "healer" : QModelData(question: """
                               당신은 어떤 스타일에 사람입니까?
                               """,
                               anwser1: "흥이 많은 타입", // (키리코, 루시우)",
                               anwser2: "다정한 스타일", // (메르시, 위버, 브리기테)",
                               anwser3: "시니컬한 성격", // (모이라, 바티스트, 일리)",
                               anwser4: "어른스러운 성격"), // (아나, 젠)"),
        "healer0" : QModelData(question: """
                               당신과 가까운 키워드는?
                               """,
                               anwser1: "활기찬 공돌이", // (루시우)",
                               anwser2: "잔꾀 많은 장난꾸러기", // (키리코)",
                               anwser3: nil,
                               anwser4: nil),
        "healer1" : QModelData(question: """
                               수강신청에 망한 당신 다음중 한가지를 꼭 수강해야한다. 그리고 A이상 받지않으면 졸업이 불가능하다. 어떤 과목을 선택하겠는가?
                               """,
                               anwser1: "의학", //(메르시)",
                               anwser2: "생화학", //(라이프위버)",
                               anwser3: "기계공학", //(브리기테)",
                               anwser4: nil),
        "healer2" : QModelData(question: """
                               다음 중 잘한 사람은?
                               """,
                               anwser1: "많은 무고한 생체 실험을 감행했지만 인류를 진화를 목전에 둔 사람", //(모이라)",
                               anwser2: "전쟁에 나가서 많은 적을 죽였지만 아군도 많이 살린 사람", //(바티)",
                               anwser3: "나라를 구한 가문의 자제. 그러나 실수로 동네 사람을 전부 죽인 사람", //(일리아리)",
                               anwser4: nil),
        "healer3" : QModelData(question: """
                               물론 당신은 대인배이다. 그러나 진짜 너무 싫은 사람을 보면 드는 생각은?
                               """,
                               anwser1: "마취총 쏴버리고싶다.", //(아나)",
                               anwser2: "발로 차버리고싶다.", //(젠야타)",
                               anwser3: nil,
                               anwser4: nil)
    ]
    

