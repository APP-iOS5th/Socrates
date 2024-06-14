//
//  GuessWhoViewController.swift
//  KnowYourselfApp
//
//  Created by 김형준 on 5/31/24.
//  Created by seokyung on 6/11/24.
//

import UIKit

class GuessWhoViewController: UIViewController {
    private var viewModel: GuessViewModel!
    
    let questionText = UILabel()
    let oneButton = UIButton(type: .system)
    let twoButton = UIButton(type: .system)
    let threeButton = UIButton(type: .system)
    let backButton = UIButton(type: .system)
    let nextButton = UIButton(type: .system)
    let progressView = UIProgressView(progressViewStyle: .default)
    let backgroundImageView = UIImageView()
    let questionBackgroundImageView = UIImageView()
    
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
        self.title = "앱스쿨 유형 테스트"
        self.view.backgroundColor = .white
        
        questionBackgroundImageView.image = UIImage(named: "chalkboard")
        questionBackgroundImageView.contentMode = .scaleAspectFill
        
        
        backgroundImageView.image = UIImage(named: "GuessWhoBG")
        backgroundImageView.contentMode = .scaleAspectFill
        
        progressView.progressTintColor = .yellow
        progressView.trackTintColor = .white
        
        questionText.numberOfLines = 2
        questionText.textAlignment = .center
        questionText.font = UIFont(name: "HakgyoansimDoldamB", size: 21)
        questionText.textColor = .white
        
        setupButton(oneButton, title: "Option 1")
        setupButton(twoButton, title: "Option 2")
        setupButton(threeButton, title: "Option 3")
        
        setupNavigationButton(backButton, title: "이전")
        setupNavigationButton(nextButton, title: "다음")
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(questionBackgroundImageView)
        view.addSubview(progressView)
        view.addSubview(questionText)
        view.addSubview(oneButton)
        view.addSubview(twoButton)
        view.addSubview(threeButton)
        view.addSubview(backButton)
        view.addSubview(nextButton)
        
        setupConstraints()
    }
    
    private func setupNavigationButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "HakgyoansimDoldamB", size: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: title == "이전" ? #selector(backButtonTap) : #selector(handleNextButtonTap), for: .touchUpInside)
    }
    
    private func setupButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont(name: "HakgyoansimDoldamM", size: 20)
        button.layer.cornerRadius = 8
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        questionText.translatesAutoresizingMaskIntoConstraints = false
        oneButton.translatesAutoresizingMaskIntoConstraints = false
        twoButton.translatesAutoresizingMaskIntoConstraints = false
        threeButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        questionBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            progressView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            progressView.widthAnchor.constraint(equalToConstant: 330),
            progressView.heightAnchor.constraint(equalToConstant: 20),
            
            questionBackgroundImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            questionBackgroundImageView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 100),
            questionBackgroundImageView.widthAnchor.constraint(equalToConstant: 330),
            questionBackgroundImageView.heightAnchor.constraint(equalToConstant: 150),
            
            questionText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            questionText.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 150),
            questionText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            questionText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            oneButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            oneButton.topAnchor.constraint(equalTo: questionBackgroundImageView.bottomAnchor, constant: 80),
            oneButton.widthAnchor.constraint(equalToConstant: 330),
            
            twoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            twoButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: 20),
            twoButton.widthAnchor.constraint(equalToConstant: 330),
            
            threeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            threeButton.topAnchor.constraint(equalTo: twoButton.bottomAnchor, constant: 20),
            threeButton.widthAnchor.constraint(equalToConstant: 330),
            
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            backButton.widthAnchor.constraint(equalToConstant: 120),
            
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            nextButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func loadQuestion() {
        let currentQuestion = viewModel.currentQuestion
        questionText.text = currentQuestion.question
        
        oneButton.setTitle(currentQuestion.answerOne, for: .normal)
        twoButton.setTitle(currentQuestion.answerTwo, for: .normal)
        threeButton.setTitle(currentQuestion.answerThree, for: .normal)
        
        oneButton.backgroundColor = .white
        twoButton.backgroundColor = .white
        threeButton.backgroundColor = .white
        
        if let selectedAnswerIndex = viewModel.selectedAnswerIndex {
            switch selectedAnswerIndex {
            case 0:
                oneButton.backgroundColor = .yellow
            case 1:
                twoButton.backgroundColor = .yellow
            case 2:
                threeButton.backgroundColor = .yellow
            default:
                break
            }
        }
        
        backButton.isHidden = viewModel.currentQuizNo == 0
        nextButton.setTitle(viewModel.isLastQuestion ? "결과보기" : "다음", for: .normal)
        progressView.setProgress(viewModel.progress, animated: true)
    }
    
    @objc private func answerButtonTapped(_ sender: UIButton) {
        oneButton.backgroundColor = .white
        twoButton.backgroundColor = .white
        threeButton.backgroundColor = .white
        
        sender.backgroundColor = .yellow
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
            let okAction = UIAlertAction(title: "확인", style:.default, handler: nil)
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
            resultView.resultText = result.name
            resultView.resultImageName = result.imageName
        } else {
            resultView.resultText = "독보적입니다"
        }
        show(resultView, sender: nil)
    }
}
