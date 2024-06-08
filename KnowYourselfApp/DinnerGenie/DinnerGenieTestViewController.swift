//
//  FourthTestViewController.swift
//  Know Yourself
//
//  Created by 김소희 on 5/31/24.
//

import UIKit

class FourthTestViewController: UIViewController {
    
    private let progressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .bar)
        progressBar.progress = 0.0
        progressBar.trackTintColor = .lightGray
        progressBar.progressTintColor = .blue
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let yesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("O", for: .normal)
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
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(noButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let questions = ["오늘은 저녁은 술과 함께 한다","자극적인게 땡긴다", "국물 있는 음식이 먹고싶다"]
    private var currentQuestionIndex = 0
    private var answers = [Bool]()
    private var isDrinking = false
    private var wantsSpicy = false
    private var wantsSoup = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "저녁메뉴추천 테스트"
        view.backgroundColor = .white
        
        view.addSubview(progressBar)
        view.addSubview(questionLabel)
        view.addSubview(yesButton)
        view.addSubview(noButton)
        
        dinnerGenieQuestion()
        NextdinnerGenieQuestion()
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        yesButton.translatesAutoresizingMaskIntoConstraints = false
        noButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func dinnerGenieQuestion() {
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 34.5),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            progressBar.heightAnchor.constraint(equalToConstant: 20),
            
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
    
    private func NextdinnerGenieQuestion() {
        if currentQuestionIndex < questions.count {
            questionLabel.text = questions[currentQuestionIndex]
            progressBar.progress = Float(currentQuestionIndex) / Float(questions.count)
        } else {
            showResult()
        }
    }
    
    @objc private func yesButtonTapped() {
        answers.append(true)
        updateUserPreferences()
        updateProgressBar()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.currentQuestionIndex += 1
            self.NextdinnerGenieQuestion()
        }
    }
    
    @objc private func noButtonTapped() {
        answers.append(false)
        updateProgressBar()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.currentQuestionIndex += 1
            self.NextdinnerGenieQuestion()
        }
    }
    
    private func updateProgressBar() {
            let progress = Float(currentQuestionIndex + 1) / Float(questions.count)
            progressBar.setProgress(progress, animated: true)
        }
    
    private func updateUserPreferences() {
           switch currentQuestionIndex {
           case 0:
               isDrinking = answers[currentQuestionIndex]
           case 1:
               wantsSpicy = answers[currentQuestionIndex]
           case 2:
               wantsSoup = answers[currentQuestionIndex]
           default:
               break
           }
       }
    
    private func showResult() {
            let resultViewController = GameResultViewController()
            resultViewController.isDrinking = isDrinking
            resultViewController.wantsSpicy = wantsSpicy
            resultViewController.wantsSoup = wantsSoup
            navigationController?.pushViewController(resultViewController, animated: true)
        }
    }

    class GameResultViewController: UIViewController {
        
        var isDrinking = false
        var wantsSpicy = false
        var wantsSoup = false
        
        private let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "오늘의 저녁 추천 메뉴는?"
            label.font = UIFont.systemFont(ofSize: 20)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private let resultImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        private let resultLabel: UILabel = {
            let label = UILabel()
            label.text = "추천메뉴: 나가사키짬뽕"
            label.font = UIFont.systemFont(ofSize: 20)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private let reRecommendButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("재추천", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.borderWidth = 2
            button.layer.cornerRadius = 8
            button.addTarget(self, action: #selector(reRecommendButtonTapped), for: .touchUpInside)
            return button
        }()
        private let shareButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("공유", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 2
            button.layer.cornerRadius = 8
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        private let saveButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("저장", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 2
            button.layer.cornerRadius = 8
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        private let homeButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("다른 테스트 하러가기", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 2
            button.layer.cornerRadius = 8
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            
            view.addSubview(titleLabel)
            view.addSubview(resultImageView)
            view.addSubview(resultLabel)
            view.addSubview(reRecommendButton)
            view.addSubview(shareButton)
            view.addSubview(saveButton)
            view.addSubview(homeButton)
            setupConstraints()
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                resultImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                resultImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                resultImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                resultImageView.heightAnchor.constraint(equalToConstant: 300),
                
                resultLabel.topAnchor.constraint(equalTo: resultImageView.bottomAnchor, constant: 20),
                resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                reRecommendButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 40),
                reRecommendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                reRecommendButton.widthAnchor.constraint(equalToConstant: 150),
                reRecommendButton.heightAnchor.constraint(equalToConstant: 45),
                
                shareButton.topAnchor.constraint(equalTo: reRecommendButton.bottomAnchor, constant: 20),
                shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                shareButton.widthAnchor.constraint(equalToConstant: 130),
                shareButton.heightAnchor.constraint(equalToConstant: 45),
                
                saveButton.topAnchor.constraint(equalTo: shareButton.topAnchor),
                saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                saveButton.widthAnchor.constraint(equalToConstant: 130),
                saveButton.heightAnchor.constraint(equalToConstant: 45),
                
                homeButton.topAnchor.constraint(equalTo: reRecommendButton.bottomAnchor, constant: 130),
                homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                homeButton.widthAnchor.constraint(equalToConstant: 150),
                homeButton.heightAnchor.constraint(equalToConstant: 45)
            ])
        }
        
        @objc private func reRecommendButtonTapped() {
            updateResult()
        }
        
        private func updateResult() {
            
        }
    }

