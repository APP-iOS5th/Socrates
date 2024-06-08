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
        progressBar.progress = 0.33
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘 저녁은 술과 함께 한다"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "저녁메뉴추천 테스트"
        view.backgroundColor = .white
        
        view.addSubview(progressBar)
        view.addSubview(questionLabel)
        view.addSubview(yesButton)
        view.addSubview(noButton)
        
        dinnerGenieQuestion()
        
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
    @objc private func yesButtonTapped() {
        let nextViewController = SecondGameViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    @objc private func noButtonTapped() {
        let nextViewController = SecondGameViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    class SecondGameViewController: UIViewController {
        
        var isDrinking = false
        
        private let progressBar: UIProgressView = {
            let progressBar = UIProgressView(progressViewStyle: .bar)
            progressBar.progress = 0.66
            progressBar.translatesAutoresizingMaskIntoConstraints = false
            return progressBar
        }()
        
        private let spicyLabel: UILabel = {
            let label = UILabel()
            label.text = "자극적인게 땡긴다"
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
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "저녁메뉴추천 테스트"
            view.backgroundColor = .white
            
            view.addSubview(progressBar)
            view.addSubview(spicyLabel)
            view.addSubview(yesButton)
            view.addSubview(noButton)
            
            dinnerGenieQuestion()
            
            spicyLabel.translatesAutoresizingMaskIntoConstraints = false
            yesButton.translatesAutoresizingMaskIntoConstraints = false
            noButton.translatesAutoresizingMaskIntoConstraints = false
        }
        
        private func dinnerGenieQuestion() {
            NSLayoutConstraint.activate([
                progressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 34.5),
                progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
                progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
                progressBar.heightAnchor.constraint(equalToConstant: 20),
                
                spicyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
                spicyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                spicyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                yesButton.topAnchor.constraint(equalTo: spicyLabel.bottomAnchor, constant: 76),
                yesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                yesButton.widthAnchor.constraint(equalToConstant: 80),
                yesButton.heightAnchor.constraint(equalToConstant: 45),
                
                noButton.topAnchor.constraint(equalTo: yesButton.bottomAnchor, constant: 20),
                noButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                noButton.widthAnchor.constraint(equalToConstant: 80),
                noButton.heightAnchor.constraint(equalToConstant: 45)
            ])
        }
        
        @objc private func yesButtonTapped() {
            let nextViewController = ThirdGameViewController()
            nextViewController.isDrinking = isDrinking
            nextViewController.wantsSpicy = true
            navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        @objc private func noButtonTapped() {
            let nextViewController = ThirdGameViewController()
            nextViewController.isDrinking = isDrinking
            nextViewController.wantsSpicy = false
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    class ThirdGameViewController: UIViewController {
        
        var isDrinking = false
        var wantsSpicy = false
        
        private let progressBar: UIProgressView = {
            let progressBar = UIProgressView(progressViewStyle: .bar)
            progressBar.progress = 1
            progressBar.translatesAutoresizingMaskIntoConstraints = false
            return progressBar
        }()
        
        private let soupLabel: UILabel = {
            let label = UILabel()
            label.text = "국물 있는 음식이 먹고싶다"
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
        
        private let resultLabel: UILabel = {
            let label = UILabel()
            label.text = ""
            label.numberOfLines = 0
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "저녁메뉴추천 테스트"
            view.backgroundColor = .white
            
            view.addSubview(progressBar)
            view.addSubview(soupLabel)
            view.addSubview(yesButton)
            view.addSubview(noButton)
            view.addSubview(resultLabel)
            
            dinnerGenieQuestion()
            
            soupLabel.translatesAutoresizingMaskIntoConstraints = false
            yesButton.translatesAutoresizingMaskIntoConstraints = false
            noButton.translatesAutoresizingMaskIntoConstraints = false
        }
        
        private func dinnerGenieQuestion() {
            NSLayoutConstraint.activate([
                progressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 34.5),
                progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
                progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
                progressBar.heightAnchor.constraint(equalToConstant: 20),
                
                soupLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
                soupLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                soupLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                yesButton.topAnchor.constraint(equalTo: soupLabel.bottomAnchor, constant: 76),
                yesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                yesButton.widthAnchor.constraint(equalToConstant: 80),
                yesButton.heightAnchor.constraint(equalToConstant: 45),
                
                noButton.topAnchor.constraint(equalTo: yesButton.bottomAnchor, constant: 20),
                noButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                noButton.widthAnchor.constraint(equalToConstant: 80),
                noButton.heightAnchor.constraint(equalToConstant: 45),
                
                resultLabel.topAnchor.constraint(equalTo: yesButton.bottomAnchor, constant: 50)
            ])
        }
        
        @objc private func yesButtonTapped() {
            let nextViewController = GameResultViewController()
            nextViewController.isDrinking = isDrinking
            nextViewController.wantsSpicy = wantsSpicy
            nextViewController.wantsSoup = true
            navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        @objc private func noButtonTapped() {
            let nextViewController = GameResultViewController()
            nextViewController.isDrinking = isDrinking
            nextViewController.wantsSpicy = wantsSpicy
            nextViewController.wantsSoup = false
            navigationController?.pushViewController(nextViewController, animated: true)
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
}
