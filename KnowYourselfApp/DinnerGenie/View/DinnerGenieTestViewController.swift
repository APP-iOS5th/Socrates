//
//  DinnerGenieTestViewController.swift
//  KnowYourselfApp
//
//  Created by 김소희 on 6/12/24.
//

import UIKit

class DinnerGenieTestViewController: UIViewController {
    
    private let viewModel = DinnerGenieViewModel()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.progress = 0.0
        progressView.trackTintColor = .lightGray
        progressView.progressTintColor = .blue
        progressView.layer.cornerRadius = 8
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-SemiBold", size: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let yesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("O", for: .normal)
        button.titleLabel?.font = UIFont(name: "MangoByeolbyeol", size: 20)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(yesButtonTapped), for: .touchUpInside)
        return button
    }()
    private let noButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("X", for: .normal)
        button.titleLabel?.font = UIFont(name: "MangoByeolbyeol", size: 20)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(noButtonTapped), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "저녁메뉴추천 테스트"
        view.backgroundColor = .white
        
        view.addSubview(progressView)
        view.addSubview(questionLabel)
        view.addSubview(yesButton)
        view.addSubview(noButton)
        
        setupConstraints()
        updateUI()
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        yesButton.translatesAutoresizingMaskIntoConstraints = false
        noButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 34.5),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            progressView.heightAnchor.constraint(equalToConstant: 20),
            
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            yesButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 76),
            yesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yesButton.widthAnchor.constraint(equalToConstant: 80),
            yesButton.heightAnchor.constraint(equalToConstant: 45),
            
            noButton.topAnchor.constraint(equalTo: yesButton.bottomAnchor, constant: 20),
            noButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noButton.widthAnchor.constraint(equalToConstant: 80),
            noButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func updateUI() {
        progressView.setProgress(viewModel.progress, animated: true)
        questionLabel.text = viewModel.questionText
    }
    
    @objc private func yesButtonTapped() {
        viewModel.answerQuestion(answer: true)
        handleNextStep()
    }
    
    @objc private func noButtonTapped() {
        viewModel.answerQuestion(answer: false)
        handleNextStep()
    }
    
    private func handleNextStep() {
        updateUI()
        
        if viewModel.isLastQuestion && viewModel.allQuestionsAnswered {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                self.showResultViewController()
            }
        }
    }
    
    private func showResultViewController() {
        let resultVC = DinnerGenieResultViewController(viewModel: viewModel)
        navigationController?.pushViewController(resultVC, animated: true)
    }
}
