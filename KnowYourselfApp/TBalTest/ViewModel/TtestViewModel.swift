import Combine

class QuizViewModel: ObservableObject {
    @Published var currentQuiz: Quiz?
    @Published var currentQuestionIndex: Int = 0
    @Published var totalScore: Int = 0
    @Published var isQuizCompleted: Bool = false
    
    private var quizStore = QuizStore()
    private var count = 0

    init() {
        loadCurrentQuiz()
    }
    
    func loadCurrentQuiz() {
        guard count < quizStore.quizListStore.count else {
            // 모든 퀴즈를 완료했을 때의 처리 추가
            isQuizCompleted = true
            return
        }
        currentQuiz = quizStore.quizListStore[count] as? Quiz
    }
    
    func selectAnswer(_ score: Int) {
        totalScore += score
        count += 1
        loadCurrentQuiz()
    }
}


