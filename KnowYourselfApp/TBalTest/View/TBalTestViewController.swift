
import UIKit
import Combine

class TBalTestViewController: UIViewController {

    private var viewModel = QuizViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    private let questionLabel = UILabel()
    private let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        view.addSubview(questionLabel)
        view.addSubview(stackView)
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupBindings() {
        viewModel.$currentQuiz
            .sink { [weak self] quiz in
                self?.updateUI(with: quiz)
            }
            .store(in: &cancellables)
        
        viewModel.$isQuizCompleted
            .sink { [weak self] isCompleted in
                if isCompleted {
                    self?.showResultViewController()
                }
            }
            .store(in: &cancellables)
    }
    
    private func updateUI(with quiz: Quiz?) {
        guard let quiz = quiz else { return }
        questionLabel.text = quiz.questionAsk
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for question in quiz.questions {
            let button = UIButton(type: .system)
            button.setTitle(question.content, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16)
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 8
            button.clipsToBounds = true
            button.tag = question.score
            button.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc private func optionButtonTapped(_ sender: UIButton) {
        viewModel.selectAnswer(sender.tag)
    }
    
    private func showResultViewController() {
//        let resultVC = TtestResultViewController(viewModel: viewModel)
        self.show(TtestResultViewController(viewModel: viewModel), sender: nil)
//        present(resultVC, animated: true, completion: nil)
    }
}
