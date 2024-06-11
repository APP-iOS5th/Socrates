//
//  SecondTestViewController.swift
//  Know Yourself
//
//  Created by 김형준 on 5/31/24.
//

import UIKit

func createLabel(title: String) -> UILabel {
    let label = UILabel()
    label.text = title
    label.font = .systemFont(ofSize: 22, weight: .semibold)
    label.textAlignment = .center
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}

func createButton(title: String, tag: Int, target: Any?, action: Selector) -> UIButton {
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.tintColor = .black
    button.backgroundColor = .darkGray
    button.setTitleColor(.orange, for: .normal)
    button.tag = tag
    button.addTarget(target, action: action, for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.isHidden = false
    return button
}



class FirstTestViewController: UIViewController {
    
    private var heroScore = 0
    //0~1 딜러, 2~3탱커, 4~6 힐러
    private var currentQIndex = 0
    private let questionsKeys = Array(questions.keys)
    private var QLabel: UILabel!
    private var firstButton: UIButton!
    private var secondButton: UIButton!
    private var thirdButton: UIButton!
    private var fourthButton: UIButton!
    private var currentKeyNow: String! = "none"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "오버워치 영웅 테스트"
        view.backgroundColor = .white
        
        
        
        QLabel = createLabel(title: questions["main"]!.question)
        
        // 버튼 생성
        firstButton = createButton(
            title: questions["main"]!.anwser1,
            tag: 0,
            target: self,
            action: #selector(heroScoreChanger(_:))
        )
        
        secondButton = createButton(
            title: questions["main"]!.anwser2,
            tag: 1,
            target: self,
            action: #selector(heroScoreChanger(_:))
        )
        
        thirdButton = createButton(
            title: questions["main"]!.anwser3,
            tag: 2,
            target: self,
            action: #selector(heroScoreChanger(_:))
        )
        
        
        view.addSubview(QLabel)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        
        
        NSLayoutConstraint.activate([
            QLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            QLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            QLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.centerYAnchor.constraint(equalTo: QLabel.bottomAnchor, constant: 160),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10)
            
        ])
    }
    private func loadPositionQuestion() {
        let questionKey = questionsKeys[currentQIndex]
        if let questionData = questions[questionKey] {
            QLabel.text = questionData.question
            firstButton.setTitle(questionData.anwser1, for: .normal)
            secondButton.setTitle(questionData.anwser2, for: .normal)
            thirdButton.setTitle(questionData.anwser3, for: .normal)
        }
    }
    private func loadDetailQuestion(_ key: String) {
        currentKeyNow = key
        if let questionData = questions[key] {
            QLabel.text = questionData.question
            firstButton.setTitle(questionData.anwser1, for: .normal)
            secondButton.setTitle(questionData.anwser2, for: .normal)
            thirdButton.setTitle(questionData.anwser3, for: .normal)
        }
    }
    
    @objc func heroScoreChanger(_ sender: UIButton) {
        currentQIndex += 1
        heroScore += sender.tag
        if currentQIndex > 3 {
            let key = currentKeyNow + String(sender.tag)
            switch key {
            case "tanker00": print("시그마")
            case "tanker01": print("라인")
            case "tanker02": print("자랴")
            case "tanker030": print("시그마")
            case "tanker031": print("라인")
            case "tanker032": print("자랴")
            case "tanker10": print("퀸")
            case "tanker11": print("오리사")
            case "tanker12": print("로드호그")
            case "tanker20": print("래킹")
            case "tanker21": print("둠")
            case "tanker22": print("윈스")
            case "tanker23": print("디바")
            case "dps000": print("시메")
            case "dps001": print("파라")
            case "dps010": print("겐지")
            case "dps011": print("트레")
            case "dps012": print("솜")
            case "dps020": print("메이")
            case "dps021": print("벤쳐")
            case "dps100": print("솔져")
            case "dps101": print("소전")
            case "dps102": print("바스")
            case "dps110": print("바스")
            case "dps111": print("톨비")
            case "dps120": print("리퍼")
            case "dps121": print("정크")
            case "dps200": print("캐서디")
            case "dps201": print("한조")
            case "dps210": print("위도우")
            case "dps211": print("애쉬")
            case "healer00": print("루시우")
            case "healer01": print("키리")
            case "healer10": print("멜시")
            case "healer11": print("위버")
            case "healer12": print("브리")
            case "healer20": print("모이라")
            case "healer21": print("바티")
            case "healer22": print("일리")
            case "healer30": print("아나")
            case "healer31": print("젠야타")
            default:
                loadDetailQuestion(key)
            }
        } //포지션정하고난뒤 -> 각키로 돌아가는 상황[기존키 + 태그]
        if currentQIndex == 3 {
            switch heroScore {
            case 0...1:
                let positionKey = "dps"
                loadDetailQuestion(positionKey)
            
            case 2...3:
                let positionKey = "tanker"
                loadDetailQuestion(positionKey)
            
            case 4...6: 
                let positionKey = "healer"
                loadDetailQuestion(positionKey)
                
            default: break
            }
        }//포지션이 정해지는순간-> 각포지션에 맞는 질문지 [포지션]
            if currentQIndex < 3 {
                let positionKey = "main" + String(currentQIndex)
                loadDetailQuestion(positionKey)
             //포지션 정하기전까지
        }
    }
    
    
    
}
