//
//  ThirdTestViewController.swift
//  Know Yourself
//
//  Created by 김형준 on 5/31/24.
//

import UIKit

class ThirdTestViewController: UIViewController {
    private var viewModel: GuessViewModel!
    
    let questionText = UILabel()
    let oneButton = UIButton()
    let twoButton = UIButton()
    let threeButton = UIButton()
    let backButton = UIButton()
    let nextButton = UIButton()
    let progressView = ProgressView()
    let backgroundImageView = UIImageView()
    
    init(quizList: [QuizModel]) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = GuessViewModel(quizList: quizList)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadQuestion()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        questionText.numberOfLines = 2
        questionText.textAlignment = .center
        questionText.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        setupButton(oneButton, title: "Option 1")
        setupButton(twoButton, title: "Option 2")
        setupButton(threeButton, title: "Option 3")
        
        setupNavigationButton(backButton, title: "이전")
        setupNavigationButton(nextButton, title: "다음")
        
        view.addSubview(progressView)
        view.addSubview(questionText)
        view.addSubview(oneButton)
        view.addSubview(twoButton)
        view.addSubview(threeButton)
        view.addSubview(backButton)
        view.addSubview(nextButton)
        
        setupConstraints()
    }
    
    // 이전/다음
    private func setupNavigationButton(_ button: UIButton, title: String) {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .medium
        config.baseBackgroundColor = .systemGray
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        button.configuration = config
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: title == "이전" ? #selector(backButtonTap) : #selector(handleNextButtonTap), for: .touchUpInside)
    }
    
    // 선택지
    private func setupButton(_ button: UIButton, title: String) {
        var config = UIButton.Configuration.filled()
        config.title = title
        config.baseBackgroundColor = .systemBlue
        config.cornerStyle = .medium
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        questionText.translatesAutoresizingMaskIntoConstraints = false
        oneButton.translatesAutoresizingMaskIntoConstraints = false
        twoButton.translatesAutoresizingMaskIntoConstraints = false
        threeButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            progressView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            progressView.widthAnchor.constraint(equalToConstant: 330),
            progressView.heightAnchor.constraint(equalToConstant: 20),
            
            questionText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            questionText.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 150),
            questionText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            questionText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            oneButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            oneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 330),
            oneButton.widthAnchor.constraint(equalToConstant: 330),
            
            twoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            twoButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: 20),
            twoButton.widthAnchor.constraint(equalToConstant: 330),
            
            threeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            threeButton.topAnchor.constraint(equalTo: twoButton.bottomAnchor, constant: 20),
            threeButton.widthAnchor.constraint(equalToConstant: 330),
            
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            backButton.widthAnchor.constraint(equalToConstant: 100),
            
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            nextButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func loadQuestion() {
        let currentQuestion = viewModel.currentQuestion
        questionText.text = currentQuestion.question
        
        oneButton.configuration?.title = currentQuestion.answerOne
        twoButton.configuration?.title = currentQuestion.answerTwo
        threeButton.configuration?.title = currentQuestion.answerThree
        
        oneButton.configuration?.baseBackgroundColor = .systemBlue
        twoButton.configuration?.baseBackgroundColor = .systemBlue
        threeButton.configuration?.baseBackgroundColor = .systemBlue
        
        if let selectedAnswerIndex = viewModel.selectedAnswerIndex {
            switch selectedAnswerIndex {
            case 0:
                oneButton.configuration?.baseBackgroundColor = .green
            case 1:
                twoButton.configuration?.baseBackgroundColor = .green
            case 2:
                threeButton.configuration?.baseBackgroundColor = .green
            default:
                break
            }
        }
        
        backButton.isHidden = viewModel.currentQuizNo == 0
        nextButton.setTitle(viewModel.isLastQuestion ? "결과보기" : "다음", for: .normal)
        progressView.setProgress(viewModel.progress)
    }
    
    @objc private func answerButtonTapped(_ sender: UIButton) {
        oneButton.configuration?.baseBackgroundColor = .systemBlue
        twoButton.configuration?.baseBackgroundColor = .systemBlue
        threeButton.configuration?.baseBackgroundColor = .systemBlue
        
        sender.configuration?.baseBackgroundColor = .green
        viewModel.selectedAnswerIndex = {
            switch sender {
            case oneButton:
                return 0
            case twoButton:
                return 1
            case threeButton:
                return 2
            default:
                return nil
            }
        }()
    }
    
    @objc private func handleNextButtonTap() {
        if viewModel.isLastQuestion {
            showResult()
        } else if viewModel.moveToNextQuestion() {
            loadQuestion()
        } else {
            let alert = UIAlertController(title: "선택지를 골라주세요!", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc private func backButtonTap() {
        viewModel.moveToPreviousQuestion()
        loadQuestion()
    }
    
    private func showResult() {
        let resultView = GuessWhoResultViewController()
        if let result = viewModel.getResult() {
            resultView.resultText =  result.name
            resultView.resultImageName = result.imageName
        } else {
            resultView.resultText = "다시 해보시죠."
        }
        show(resultView, sender: nil)
    }
}
