//
//  QModelData.swift
//  KnowYourselfApp
//
//  Created by 김형준 on 6/11/24.
//

import Foundation
import UIKit

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

struct Hero {
    var name: String
    var story: String
    var heroImage: UIImage?
    init(name: String, story: String, heroImage: UIImage? = nil) {
        self.name = name
        self.story = story
        self.heroImage = heroImage
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
                               anwser4: "패스하고 다음 질문지로 넘어가기"),//패스
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


var heroes: [String: Hero] = [
    "tanker00": Hero(name: "시그마\nSigma", story: "뛰어난 천체물리학자인 시브런 드 카위퍼 박사의 삶은 실험 중 불의의 사고로 중력을 제어하는 능력을 얻으면서 완전히 뒤바뀌었고, 이제는 탈론이 자기들의 목적을 위해 박사를 마음대로 조종하고 있습니다.\n돌격\n네덜란드, 헤이그(이전 기록), 국제 우주 정거장(이전 기록)\n3월 15일 (나이: 64)", heroImage: UIImage(named: "tanker00.jpg")),
    "tanker01": Hero(name: "라인하르트\nReinhardt", story: "라인하르트 빌헬름은 용맹, 정의, 용기라는 기사도의 미덕을 따르는 흘러간 시대의 옛 용사입니다.\n돌격\n독일, 슈투트가르트(이전 기록), 감시 기지: 지브롤터\n6월 26일 (나이: 63)", heroImage: UIImage(named: "tanker01.jpg")),
    "tanker02": Hero(name: "자리야\nZarya", story: "세계에서 가장 강인한 여성 중 하나인 알렉산드라 자리야노바는 한때 장래가 촉망되던 운동선수였으나, 전쟁이 시작되자 개인의 영달을 버리고 가족과 친구, 조국을 보호하기 위해 나섰습니다.\n돌격\n크라스노야르스크 최전선(이전 기록), 러시아, 시베리아, 노보안스코예 전진 기지(이전 기록), 감시 기지: 지브롤터\n12월 4일 (나이: 30)", heroImage: UIImage(named: "tanker02.jpg")),
    "tanker030": Hero(name: "시그마\nSigma", story: "뛰어난 천체물리학자인 시브런 드 카위퍼 박사의 삶은 실험 중 불의의 사고로 중력을 제어하는 능력을 얻으면서 완전히 뒤바뀌었고, 이제는 탈론이 자기들의 목적을 위해 박사를 마음대로 조종하고 있습니다.\n돌격\n네덜란드, 헤이그(이전 기록), 국제 우주 정거장(이전 기록)\n3월 15일 (나이: 64)", heroImage: UIImage(named: "tanker030.jpg")),
    "tanker031": Hero(name: "라인하르트\nReinhardt", story: "라인하르트 빌헬름은 용맹, 정의, 용기라는 기사도의 미덕을 따르는 흘러간 시대의 옛 용사입니다.\n돌격\n독일, 슈투트가르트(이전 기록), 감시 기지: 지브롤터\n6월 26일 (나이: 63)", heroImage: UIImage(named: "tanker031.jpg")),
    "tanker032": Hero(name: "자리야\nZarya", story: "세계에서 가장 강인한 여성 중 하나인 알렉산드라 자리야노바는 한때 장래가 촉망되던 운동선수였으나, 전쟁이 시작되자 개인의 영달을 버리고 가족과 친구, 조국을 보호하기 위해 나섰습니다.\n돌격\n크라스노야르스크 최전선(이전 기록), 러시아, 시베리아, 노보안스코예 전진 기지(이전 기록), 감시 기지: 지브롤터\n12월 4일 (나이: 30)", heroImage: UIImage(named: "tanker032.jpg")),
    "tanker10": Hero(name: "정커퀸\nJunker Queen", story: "도끼 '도륙'과 전자기 건틀릿으로 무장한 쓰레기 집단의 무자비한 지도자는 전 세계를 지배하려 합니다.\n돌격\n호주, 쓰레기촌\n6월 14일 (나이: 31)", heroImage: UIImage(named: "tanker10.jpg")),
    "tanker11": Hero(name: "오리사\nOrisa", story: "눔바니에서 짧은 기간 사용됐던 OR15 방어 로봇 중 하나의 부품으로 제작된 오리사는 이 도시의 새로운 수호자가 되었지만, 아직 배워야 할 게 많습니다.\n돌격\n아프리카, 눔바니\n5월 9일 (나이: 1)", heroImage: UIImage(named: "tanker11.jpg")),
    "tanker12": Hero(name: "로드호그\nRoadhog", story: "로드호그는 무분별하고 악의적인 파괴 행위로 악명을 떨치는 강력한 싸움꾼입니다.\n돌격\n호주, 쓰레기촌(이전 기록)\n9월 12일 (나이: 50)", heroImage: UIImage(named: "tanker12.jpg")),
    "tanker20": Hero(name: "레킹볼\nWrecking Ball", story: "재주 많고 고도의 지능까지 갖춘 기계공 겸 투사 레킹볼은 호라이즌 달 기지의 실험실에서 깨어나 정커퀸의 용사가 되었습니다.\n돌격\n호라이즌 달 기지(이전 기록), 쓰레기촌(이전 기록)\n10월 15일 (나이: 16)", heroImage: UIImage(named: "tanker20.jpg")),
    "tanker21": Hero(name: "둠피스트\nDoomfist", story: "둠피스트는 오버워치에 직접적으로 저항하는 테러리스트 조직이자 준군사 부대인 탈론의 계산적인 지도자입니다.\n돌격\n나이지리아, 오요(이전 기록), 이탈리아, 로마\n5월 25일 (나이: 47)", heroImage: UIImage(named: "tanker21.jpg")),
    "tanker22": Hero(name: "윈스턴\nWinston", story: "윈스턴은 극도로 지적인 유전자 조작 고릴라입니다. 훌륭한 과학자이자 인류가 지닌 잠재력의 강력한 옹호자이기도 합니다.\n돌격\n호라이즌 달 기지(이전 기록), 감시 기지: 지브롤터\n6월 6일 (나이: 31)", heroImage: UIImage(named: "tanker22.jpg")),
    "tanker23": Hero(name: "D.va(송하나)", story: "프로게이머 출신인 D.Va는 이제 뛰어난 실력으로 최첨단 메카를 조종하며 조국을 수호합니다.\n돌격\n대한민국, 부산, MEKA 기지(이전 기록), 감시 기지: 지브롤터\n6월 22일 (나이: 21)", heroImage: UIImage(named: "tanker23.jpg")),
    "dps000": Hero(name: "시메트라\nSymmetra", story: "시메트라는 말 그대로 현실을 뒤틉니다. 그녀는 완벽한 사회를 구현하겠다는 희망 아래, 경화광으로 이루어진 구조물을 창조해 자신이 바라는 세계를 형성합니다.\n공격\n인도, 유토페아\n10월 2일 (나이: 30)", heroImage: UIImage(named: "dps000.jpg")),
    "dps001": Hero(name: "파라\nPharah", story: "파리하 아마리의 사명감은 그 핏줄을 타고 흐릅니다. 유서 깊은 군인 가문 출신인 그녀에겐 명예롭게 조국을 섬기겠다는 열정이 타오릅니다.\n공격\n이집트, 기자(이전 기록), 감시 기지: 지브롤터\n4월 15일 (나이: 34)", heroImage: UIImage(named: "dps001.jpg")),
    "dps010": Hero(name: "겐지\nGenji", story: "사이보그 시마다 겐지는 한때 거부했던 자신의 로봇 육체를 받아들였으며, 그 과정에서 한 차원 더 높은 인간성을 갖게 되었습니다.\n공격\n일본, 하나무라(이전 기록), 네팔, 샴발리 수도원(이전 기록), 감시 기지: 지브롤터\n10월 28일 (나이: 37)", heroImage: UIImage(named: "dps010.jpg")),
    "dps011": Hero(name: "트레이서\nTracer", story: "전직 오버워치 요원인 트레이서는 시간을 넘나드는 활기찬 모험가입니다.\n공격\n영국, 런던, 감시 기지: 지브롤터\n2월 17일 (나이: 28)", heroImage: UIImage(named: "dps011.jpg")),
    "dps012": Hero(name: "솜브라\nSombra", story: "세계에서 가장 악명 높은 해커로 손꼽히는 솜브라는 정보를 이용해 권력자들을 조종합니다.\n공격\n멕시코, 도라도\n12월 31일 (나이: 32)", heroImage: UIImage(named: "dps012.jpg")),
    "dps020": Hero(name: "메이\nMei", story: "메이는 환경을 보존하기 위해 자기 손으로 직접 싸우는 과학자입니다.\n공격\n중국, 시안(이전 기록)\n9월 5일 (나이: 33)", heroImage: UIImage(named: "dps020.jpg")),
    "dps021": Hero(name: "벤쳐\nVenture", story: "벤처는 전 세계를 누비며 역사의 수수께끼를 푸는 데 열정을 쏟는 고고학자이자 탐험가입니다.\n공격\n캐나다 노바스코샤(이전), 고정 거주지 없음\n8월 6일 나이: 26세", heroImage: UIImage(named: "dps021.jpg")),
    "dps100": Hero(name: "솔져: 76\nSoldier: 76", story: "솔저: 76이라 불리며 국제 사회의 추적을 받고 있는 이 자경단원은 오버워치 몰락의 배후에 있는 진실을 드러내기 위해 개인적인 전쟁을 선포했습니다.\n공격\n알 수 없음\n1월 27일 (나이: 58)", heroImage: UIImage(named: "dps100.jpg")),
    "dps101": Hero(name: "소전\nSojourn", story: "흘러간 시절 속 오버워치의 지도자인 비비안 체이스, 호출명 소전은 새로운 영웅들이 과거의 실수를 반복하는 일이 없도록 하기 위해 최선을 다합니다.\n공격\n캐나다, 토론토\n1월 12일 (나이: 51)", heroImage: UIImage(named: "dps101.jpg")),
    "dps102": Hero(name: "바스티온\nBastion", story: "끔찍했던 옴닉 사태의 최전선에 있던 이 호기심 많은 바스티온은 아름다운 자연에 매료되어, 냉혹한 인류를 두려워하면서도 세계를 탐험합니다.\n공격\n스웨덴, 예테보리\n알 수 없음 (나이: 32)", heroImage: UIImage(named: "dps102.jpg")),
    "dps110": Hero(name: "바스티온\nBastion", story: "끔찍했던 옴닉 사태의 최전선에 있던 이 호기심 많은 바스티온은 아름다운 자연에 매료되어, 냉혹한 인류를 두려워하면서도 세계를 탐험합니다.\n공격\n스웨덴, 예테보리\n알 수 없음 (나이: 32)", heroImage: UIImage(named: "dps110.jpg")),
    "dps111": Hero(name: "토르비욘\nTorbjorn", story: "전성기 시절의 오버워치는 지구상에서 가장 진보된 최첨단 무기를 보유했으며, 그 무기의 출처는 바로 토르비욘 린드홀름이라는 전무후무한 기술자의 작업장이었습니다.\n공격\n스웨덴, 예테보리\n9월 21일 (나이: 59)", heroImage: UIImage(named: "dps111.jpg")),
    "dps120": Hero(name: "리퍼\nReaper", story: "사람들은 종종 리퍼라고만 알려진, 검은 망토를 입은 테러리스트에 대해 이야기합니다. 그의 신원과 활동 동기는 모두 베일에 감싸여 있지만, 분명한 것 하나는, 리퍼가 나타나는 곳에는 언제나 죽음의 그림자가 드리운다는 사실입니다.\n공격\n이탈리아, 로마\n12월 14일 (나이: 60)", heroImage: UIImage(named: "dps120.jpg")),
    "dps121": Hero(name: "정크랫\nJunkrat", story: "정크랫은 폭발물에 광적으로 집착하며, 세상에 혼돈과 파괴를 불러오기 위해 살아가는 폭파 전문가입니다.\n공격\n호주, 쓰레기촌(이전 기록)\n2월 29일 (나이: 27)", heroImage: UIImage(named: "dps121.jpg")),
    "dps200": Hero(name: "캐서디\nCassidy", story: "피스키퍼 리볼버로 무장한 무법자 콜 캐서디는 자신만의 방침에 따라 정의를 실현합니다.\n공격\n미국, 뉴멕시코, 산타페(이전 기록), 감시 기지: 지브롤터\n7월 31일 (나이: 39)", heroImage: UIImage(named: "dps200.jpg")),
    "dps201": Hero(name: "한조\nHanzo", story: "궁수이자 암살자로서 실력을 연마한 시마다 한조는 자신이 타의 추종을 불허하는 전사임을 증명하려고 애씁니다.\n공격\n일본, 하나무라(이전 기록)\n11월 3일 (나이: 40)", heroImage: UIImage(named: "dps201.jpg")),
    "dps210": Hero(name: "위도우메이커\nWidowmaker", story: "위도우메이커는 비할 데 없는 암살자입니다. 참을성 있게 한 순간의 빈틈을 노리고, 아무런 자비 없이 효과적인 살상을 하는 그녀에게는 일말의 감정도 후회도 없습니다.\n공격\n프랑스, 안시\n11월 19일 (나이: 35)", heroImage: UIImage(named: "dps210.jpg")),
    "dps211": Hero(name: "애쉬\nAshe", story: "애쉬는 주도면밀하고 야심 찬 데드락 저항단의 두목이자 범죄의 세계에서 상징적인 인물입니다.\n공격\n미국, 아리조나, 데드락 협곡\n10월 1일 (나이: 41)", heroImage: UIImage(named: "dps211.jpg")),
    "healer00": Hero(name: "루시우\nLucio", story: "루시우는 음악과 행동주의로 사회 변화를 주도하는 세계적인 유명 인사입니다.\n지원\n브라질, 리우데자네이루\n3월 20일 (나이: 28)", heroImage: UIImage(named: "healer00.jpg")),
    "healer01": Hero(name: "키리코Kiriko\n", story: "카네자카 신사의 미코이자 시마다 전 검성의 딸인 카모리 키리코는 영적 능력 및 인술을 활용하여 분열된 고향을 치유합니다.\n지원\n일본, 카네자카\n7월 7일 (나이: 21)", heroImage: UIImage(named: "healer01.jpg")),
    "healer10": Hero(name: "메르시\nMercy", story: "수호천사와도 같이 사람을 보살피는 앙겔라 치글러 박사는 발군의 치유사이자 뛰어난 과학자, 열성적인 평화주의자입니다.\n지원\n스위스, 취리히(이전 기록), 감시 기지: 지브롤터\n5월 13일 (나이: 39)", heroImage: UIImage(named: "healer10.jpg")),
    "healer11": Hero(name: "라이프위버\nLifeweaver", story: "식물과 경화광을 결합한 기술인 생체광을 창조한 천재적인 발명가입니다. 세계를 치유하는 것이 꿈입니다.\n지원\n대서양 생태도시\n4월 28일 (나이: 31)", heroImage: UIImage(named: "healer11.jpg")),
    "healer12": Hero(name: "브리기테\nBrigitte", story: "브리기테 린드홀름은 방관하고만 있기를 거부하고 도움이 필요한 이들을 지키고자 무기를 들었습니다.\n지원\n스웨덴, 예테보리(이전 기록), 감시 기지: 지브롤터\n9월 22일 (나이: 25)", heroImage: UIImage(named: "healer12.jpg")),
    "healer20": Hero(name: "모이라\nMoira", story: "뛰어난 실력만큼 논란도 끊이지 않는 과학자 모이라 오디오런은 유전 공학의 최첨단을 달리며 생명체의 기본적인 구성 요소를 고쳐 쓸 방법을 찾고 있습니다.\n지원\n이라크, 오아시스\n4월 4일 (나이: 50)", heroImage: UIImage(named: "healer20.jpg")),
    "healer21": Hero(name: "바티스트\nBaptiste", story: "최정예 전투 의무병이자 전 탈론 요원이었던 바티스트는 이제 전쟁에 희생된 사람들의 삶을 돕는 일에 자신의 능력을 사용합니다.\n지원\n아이티, 토르투가(이전 기록), 감시 기지: 지브롤터\n3월 12일 (나이: 38)", heroImage: UIImage(named: "healer21.jpg")),
    "healer22": Hero(name: "일리아리\nIllari", story: "최후의 인티 전사인 일리아리는 태양의 힘을 담는 그릇입니다. 과거를 속죄하기 위해서라면 무엇이든 할 겁니다.\n지원\n페루 루나사피\n12월 21일 (나이: 18)", heroImage: UIImage(named: "healer22.jpg")),
    "healer30": Hero(name: "아나\nAna", story: "오버워치 창립자 중 한 명인 아나는 탁월한 전투 능력과 노련함으로 고향과 자신에게 가장 소중한 이들을 지킵니다.\n지원\n이집트, 카이로\n1월 1일 (나이: 62)", heroImage: UIImage(named: "healer30.jpg")),
    "healer31": Hero(name: "젠야타\nZenyatta", story: "젠야타는 정신적 깨달음을 위해 온 세계를 방랑하는 옴닉 수도사입니다. 젠야타와 만나는 사람은 모두 전혀 다른 존재로 다시 태어난다는 말이 있습니다.\n지원\n네팔, 샴발리 수도원(이전 기록)\n7월 14일 (나이: 33)", heroImage: UIImage(named: "healer31.jpg"))
]
