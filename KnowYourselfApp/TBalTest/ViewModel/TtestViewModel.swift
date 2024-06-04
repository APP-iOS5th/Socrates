import Combine

class TtestViewModel: ObservableObject {
    @Published var currentQuiz: Ttest?
    @Published var currentQuestionIndex: Int = 0
    @Published var totalScore: Int = 0
    @Published var isQuizCompleted: Bool = false
    
    private var quizStore = TtestStore()
    private var count = 0
    private var prevScore: [Int] = []

    init() {
        loadCurrentQuiz()
    }
    
    // Load
    func loadCurrentQuiz() {
        guard count < quizStore.quizListStore.count else {
            // 모든 퀴즈를 완료했을 때의 처리 추가
            isQuizCompleted = true
            return
        }
        currentQuiz = quizStore.quizListStore[count] as? Ttest
  
    }
    
    // 답변 클릭
    func selectAnswer(_ score: Int) {
        totalScore += score
        count += 1
        prevScore.append(score)
        currentQuestionIndex += 1
        loadCurrentQuiz()
    }
    
    // 이전 질문
    func prevQuestion() {
        guard count > 0 else { return }
        count -= 1
        currentQuestionIndex -= 1
        if let lastScore = prevScore.popLast() {
            totalScore -= lastScore
        }
        loadCurrentQuiz()
    }
}


