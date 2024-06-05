//
//  FourthTestViewController.swift
//  Know Yourself
//
//  Created by 김소희 on 5/31/24.
//

import UIKit

class FourthTestViewController: UIViewController {
    
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
            return button
        }()
        
        private let noButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("X", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 2
            button.layer.cornerRadius = 8
            button.translatesAutoresizingMaskIntoConstraints = false
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
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
    }
}
