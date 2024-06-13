//
//  TtestStore.swift
//  KnowYourselfApp
//
//  Created by SeongKook on 6/5/24.
//

import Foundation


struct TtestStore {
    var quizListStore: [Ttest] = [Ttest(questionAsk: "영화를 보고 나서 울고 있는 친구, 당신의 반응은?",
                                              questions: [TtestList(content: "이미 같이 울고 있다.", score: 10),
                                                          TtestList(content: "엥? 눈물 날 정도의 장면이 있었나?", score: 0)]),
                                         
                                          Ttest(questionAsk: "모든 일에 있어 가장 중요한 것은 무엇인가?",
                                              questions: [TtestList(content: "노력과 과정", score: 0),
                                                          TtestList(content: "원인과 결과", score: 10)]),
                                         
                                          Ttest(questionAsk: "어쩌다 친구의 잘못으로 싸우게 되었다. 어떤 말에 내 기분이 풀릴 수 있을까?",
                                              questions: [TtestList(content: "속상하게 해서 미안해.. 네 마음을 이해하지 못했어..", score: 0),
                                                          TtestList(content: "이 부분은 내가 잘못했어.. 앞으로는 그러지 않도록 노력할게", score: 10)]),
                                         
                                          Ttest(questionAsk: "친구가 안 어울리는 색으로 염색을 하고 왔다. 이때 나는?",
                                              questions: [TtestList(content: "너는 다른 색이 더 잘 어울려라고 솔직하게 애기해 준다.", score: 10),
                                                          TtestList(content: "안 어울리긴 하지만.. 그래도 잘 어울린다고 말해준다.", score: 0)]),
                                         
                                          Ttest(questionAsk: "별로 안 친한 친구가 고민 상담을 한다. 이때 나는?",
                                              questions: [TtestList(content: "흠.. 굳이 왜 나한테 얘기하지?", score: 10),
                                                          TtestList(content: "속 얘기를 할 정도로 나를 믿는구나…(감동)", score: 0)]),
                                         
                                          Ttest(questionAsk: "친구가 떡볶이를 먹다가 오늘 처음 입은 옷에 흘렸다. 이때 나는?",
                                              questions: [TtestList(content: "기다려봐, 물티슈 가져올게.", score: 10),
                                                          TtestList(content: "오늘 처음 입은 옷이잖아, 괜찮아?", score: 0)]),
                                         
                                          Ttest(questionAsk: "친구가 회사에서 상사한테 엄청 깨졌다고 하소연을 한다. 이때 나는?",
                                              questions: [TtestList(content: "왜? 뭐 때문에 혼났는데?", score: 10),
                                                          TtestList(content: "너무한다, 진짜 속상하겠다ㅠㅜ 괜찮아?", score: 0)]),
                                         
                                          Ttest(questionAsk: "내가 만나고 싶은 이성은?",
                                              questions: [TtestList(content: "배울 점이 많고 존경할 수 있는 사람", score: 10),
                                                          TtestList(content: "나에게 한없이 다정하고 따뜻한 사람", score: 0)]),
                                         
                                          Ttest(questionAsk: "친한 친구가 무리한 부탁을 한다. 이때 나는?",
                                              questions: [TtestList(content: "냉정하게 거절한다.", score: 10),
                                                          TtestList(content: "미안해 하며 거절한다.", score: 0)]),
                                         
                                          Ttest(questionAsk: "오늘 정말 힘든 하루였다. 친구가 해줬으면 하는 말은?",
                                              questions: [TtestList(content: "무슨 일 있었어? 같이 해결해 보자.", score: 10),
                                                          TtestList(content: "많이 힘들었겠다… 지금은 좀 어때? 괜찮아?", score: 0)]),
    ]
}
