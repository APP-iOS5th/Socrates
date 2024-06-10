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
    
    private let questions = ["오늘은 저녁은 술과 함께 한다","자극적인게 땡긴다","국물 있는 음식이 먹고싶다"]
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
    
    private func NextdinnerGenieQuestion() {
        if currentQuestionIndex < questions.count {
            questionLabel.text = questions[currentQuestionIndex]
            progressBar.progress = Float(currentQuestionIndex) / Float(questions.count)
        } else {
            showResult()
        }
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
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        private let resultLabel: UILabel = {
            let label = UILabel()
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
            updateResult()
            
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                resultImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                resultImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                resultImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                resultImageView.heightAnchor.constraint(equalToConstant: 370),
                
                resultLabel.topAnchor.constraint(equalTo: resultImageView.bottomAnchor, constant: 20),
                resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                reRecommendButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 30),
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
                
                homeButton.topAnchor.constraint(equalTo: reRecommendButton.bottomAnchor, constant: 100),
                homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                homeButton.widthAnchor.constraint(equalToConstant: 150),
                homeButton.heightAnchor.constraint(equalToConstant: 45)
            ])
        }
        
        @objc private func reRecommendButtonTapped() {
            updateResult()
        }
        
        private func updateResult() {
            
            let recommendedMenu = getRecommendedMenu()
            resultImageView.image = UIImage(named: recommendedMenu)
            resultLabel.text = "추천 메뉴: \(recommendedMenu)"
            
        func getRecommendedMenu() -> String {
            let drinkOptions = ["치킨", "짬뽕", "마라탕", "피자", "회,초밥", "족발,보쌈", "김치찌개", "삼겹살", "떡볶이", "팔보채", "곱창,막창", "파전", "양꼬치", "닭발", "해물탕", "감자탕", "홍합탕", "나가사끼짬뽕", "제육볶음", "아구찜", "불닭볶음면", "라면", "쭈꾸미볶음", "부대찌개", "국밥", "설렁탕", "알탕", "순대볶음", "매운족발"]
            let nonDrinkOptions = ["치킨", "짜장면", "짬뽕", "햄버거", "마라탕", "피자", "회,초밥", "족발,보쌈",  "김치찌개", "된장찌개", "불고기", "비빔밥", "삼겹살", "갈비찜", "떡볶이", "팔보채", "곱창,막창", "파스타", "양꼬치", "닭발", "해물탕", "감자탕", "홍합탕", "나가사끼짬뽕", "제육볶음", "아구찜", "순두부찌개", "김밥", "김치볶음밥", "냉면", "불닭볶음면", "라면", "돈가스", "쭈꾸미볶음", "부대찌개", "국밥", "설렁탕", "알탕", "순대볶음", "매운족발", "쌀국수"]
            var options: [String]
            
            if isDrinking {
                if wantsSpicy && wantsSoup {
                    options = ["마라탕", "김치찌개", "해물탕", "부대찌개", "알탕", "감자탕", "라면", "짬뽕"]
                } else if wantsSpicy && !wantsSoup {
                    options = ["닭발", "떡볶이", "제육볶음", "아구찜", "불닭볶음면", "쭈꾸미볶음", "양꼬치", "순대볶음", "매운족발"]
                } else if !wantsSpicy && wantsSoup {
                    options = ["홍합탕", "나가사끼짬뽕", "국밥", "설렁탕"]
                } else {
                    options = ["치킨", "피자", "회,초밥", "족발,보쌈", "삼겹살", "팔보채", "곱창,막창", "파전"]
                }
            } else {
                if wantsSpicy && wantsSoup {
                    options = ["마라탕", "김치찌개", "해물탕", "부대찌개", "알탕", "감자탕", "라면", "짬뽕"]
                } else if wantsSpicy && !wantsSoup {
                    options = ["닭발", "떡볶이", "제육볶음", "아구찜", "불닭볶음면", "쭈꾸미볶음", "양꼬치", "순대볶음", "김치볶음밥", "매운족발"]
                } else if !wantsSpicy && wantsSoup {
                    options = ["홍합탕", "나가사끼짬뽕", "국밥", "설렁탕", "된장찌개", "냉면", "쌀국수"]
                } else {
                    options = ["치킨", "피자", "회,초밥", "족발,보쌈", "삼겹살", "팔보채", "곱창,막창",  "짜장면", "햄버거", "불고기", "비빔밥", "갈비찜", "파스타", "김밥", "돈가스"]
                }
            }
                
                return options.randomElement() ?? "추천할 메뉴가 없습니다."
            }
        }
    }
