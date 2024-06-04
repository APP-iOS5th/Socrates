
import UIKit
import Combine

class TBalTestViewController: UIViewController {
    
    // ViewModel
    private var tTestViewModel = TtestViewModel()
    // Combine
    private var cancellables = Set<AnyCancellable>()
    
    
    private let tTestProgressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .lightGray
        progressView.progressTintColor = .black
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        return progressView
    }()
    
    private let tTestProgressCount: UILabel = {
        let tTestProgressCount = UILabel()
        tTestProgressCount.textAlignment = .center
        tTestProgressCount.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        tTestProgressCount.translatesAutoresizingMaskIntoConstraints = false
        
        return tTestProgressCount
    }()
    
    private let tTestLabel: UILabel = {
        let tTestLabel = UILabel()
        tTestLabel.textAlignment = .center
        tTestLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        tTestLabel.numberOfLines = 0
        tTestLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return tTestLabel
    }()
    
    private let questionsStackView: UIStackView = {
        let questionsStackView = UIStackView()
        questionsStackView.axis = .vertical
        questionsStackView.spacing = 20
        questionsStackView.alignment = .fill
        questionsStackView.distribution = .fillEqually
        questionsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return questionsStackView
    }()
    
    private let backButton: UIButton = {
        let backButton = UIButton(type: .custom)
        var config = UIButton.Configuration.filled()
        config.title = "이전 질문"
        config.baseBackgroundColor = .black
        config.baseForegroundColor = .white
        
        backButton.configuration = config
        backButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        return backButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "T Test"
        self.view.backgroundColor = .white
        
        setupUI()
        setupBindings()
        handlerPrevBtn()
    }
    
    // BackButton
    private func handlerPrevBtn() {
        backButton.addAction(UIAction { [weak self] _ in
            self?.tTestViewModel.prevQuestion()
        }, for: .touchUpInside)
    }
    
    // UI
    private func setupUI() {
        self.view.addSubview(tTestProgressView)
        self.view.addSubview(tTestProgressCount)
        self.view.addSubview(tTestLabel)
        self.view.addSubview(questionsStackView)
        self.view.addSubview(backButton)
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tTestProgressView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            tTestProgressView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tTestProgressView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tTestProgressView.heightAnchor.constraint(equalToConstant: 20),
            
            backButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            backButton.topAnchor.constraint(equalTo: tTestProgressView.bottomAnchor, constant: 50),
            
            tTestProgressCount.bottomAnchor.constraint(equalTo: tTestLabel.topAnchor, constant: -20),
            tTestProgressCount.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tTestProgressCount.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            
            tTestLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: -50),
            tTestLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            tTestLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            questionsStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            questionsStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            questionsStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -40)
        ])
    }
    
    
    // Set<AnyCancellable>를 사용하여 여러 구독을 관리, @Published를 구독하여 상태변경 확인
    private func setupBindings() {
        tTestViewModel.$currentQuiz
            .sink { [weak self] quiz in
                self?.updateUI(with: quiz)
            }
            .store(in: &cancellables)
        
        tTestViewModel.$isQuizCompleted
            .sink { [weak self] isCompleted in
                if isCompleted {
                    self?.showResultViewController()
                }
            }
            .store(in: &cancellables)
    }
    
    // Update
    private func updateUI(with quiz: Ttest?) {
        guard let quiz = quiz else { return }
        
        tTestProgressView.progress = Float(tTestViewModel.currentQuestionIndex + 1) / 10.0
        tTestProgressCount.text = "\(tTestViewModel.currentQuestionIndex + 1) / 10"
        tTestLabel.text = quiz.questionAsk
        
        // 기존의 하위뷰를 삭제
        questionsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // questions버튼 생성
        for question in quiz.questions {
            var config = UIButton.Configuration.plain()
            config.title = question.content
            config.baseForegroundColor = .white
            config.background.backgroundColor = .black
            config.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            let button = UIButton(configuration: config)
            button.tag = question.score
            button.titleLabel?.font = .systemFont(ofSize: 18)
            button.titleLabel?.textAlignment = .center
            
            button.addAction(UIAction { _ in
                self.tTestViewModel.selectAnswer(button.tag)
            }, for: .touchUpInside)
            
            questionsStackView.addArrangedSubview(button)
        }
    }
    
    
    // 모든 질문 완료시 ResultView로 이동
    private func showResultViewController() {
        self.show(TtestResultViewController(viewModel: tTestViewModel), sender: nil)
    }
}
