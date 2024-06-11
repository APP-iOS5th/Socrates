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
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.tintColor = .black
    button.backgroundColor = .darkGray
    button.setTitleColor(.orange, for: .normal)
    button.titleLabel?.numberOfLines = 0
    button.titleLabel?.lineBreakMode = .byWordWrapping
    button.titleLabel?.font = .systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
    button.contentHorizontalAlignment = .center
    button.contentVerticalAlignment = .center
    button.tag = tag
    button.addTarget(target, action: action, for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
    
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
    private var currentKeyNow: String! = "main"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "오버워치 영웅 테스트"
        view.backgroundColor = .white
        
        setupView()
        
    }
    

    private func setupView() {
        
        QLabel = createLabel(title: questions[currentKeyNow]!.question)
        
        // 버튼 생성
        firstButton = createButton(
            title: questions[currentKeyNow]!.anwser1,
            tag: 0,
            target: self,
            action: #selector(heroScoreChanger(_:))
        )
        
        secondButton = createButton(
            title: questions[currentKeyNow]!.anwser2,
            tag: 1,
            target: self,
            action: #selector(heroScoreChanger(_:))
        )
        if let anwser3 = questions[currentKeyNow]!.anwser3 {
            thirdButton = createButton(
                title: anwser3,
                tag: 2,
                target: self,
                action: #selector(heroScoreChanger(_:))
            )
        }
        if let anwser4 = questions[currentKeyNow]!.anwser4 {
            fourthButton = createButton(
                title: anwser4,
                tag: 3,
                target: self,
                action: #selector(heroScoreChanger(_:))
            )
        }
        
        
        
        view.addSubview(QLabel)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        view.addSubview(fourthButton)
        fourthButton.isHidden = true
        
        
        var constraints = [
            QLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            QLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            QLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: QLabel.bottomAnchor, constant: 20),
            firstButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),
            secondButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
        ]
        
        if let thirdButton = thirdButton {
            constraints.append(contentsOf: [
                thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 20),
                thirdButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
                fourthButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                fourthButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: 20),
                fourthButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
            ])
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    private func resultView(_ heroNumber: String) {
        view.subviews.forEach { $0.removeFromSuperview() }
        view.backgroundColor = .white

        // 이미지 뷰 생성 및 설정
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "\(heroNumber).jpg")
                // 에셋에 추가한 이미지 이름

        // 텍스트 레이블 생성 및 설정
        let resultLabel = UILabel()
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = heroNumber
        resultLabel.font = .systemFont(ofSize: 18, weight: .regular)
        resultLabel.textColor = .black
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0

        // 뷰에 이미지 뷰 및 레이블 추가
        view.addSubview(imageView)
        view.addSubview(resultLabel)

        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            // 이미지 뷰 제약 조건
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8), // 이미지 비율 유지

            // 레이블 제약 조건
            resultLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func loadDetailQuestion(_ key: String) {
        currentKeyNow = key
        if let questionData = questions[key] {
            QLabel.text = questionData.question
            firstButton.setTitle(questionData.anwser1, for: .normal)
            secondButton.setTitle(questionData.anwser2, for: .normal)
            if let anwser3 = questionData.anwser3 {
                thirdButton.isHidden = false
                thirdButton.setTitle(anwser3, for: .normal)
            } else {
                thirdButton.isHidden = true
            }
            if let anwser4 = questionData.anwser4 {
                fourthButton.isHidden = false
                fourthButton.setTitle(anwser4, for: .normal)
            } else {
                fourthButton.isHidden = true
            }
        }
    }
    
    @objc func heroScoreChanger(_ sender: UIButton) {
        currentQIndex += 1
        heroScore += sender.tag
        if currentQIndex > 3 {
            let key = currentKeyNow + String(sender.tag)
            switch key {
            case "tanker00":
                print("시그마")
                resultView(key)
            case "tanker01": print("라인")
                resultView(key)
            case "tanker02": print("자랴")
                resultView(key)
            case "tanker030": print("시그마")
                resultView(key)
            case "tanker031": print("라인")
                resultView(key)
            case "tanker032": print("자랴")
                resultView(key)
            case "tanker10": print("퀸")
                resultView(key)
            case "tanker11": print("오리사")
                resultView(key)
            case "tanker12": print("로드호그")
                resultView(key)
            case "tanker20": print("래킹")
                resultView(key)
            case "tanker21": print("둠")
                resultView(key)
            case "tanker22": print("윈스")
                resultView(key)
            case "tanker23": print("디바")
                resultView(key)
            case "dps000": print("시메")
                resultView(key)
            case "dps001": print("파라")
                resultView(key)
            case "dps010": print("겐지")
                resultView(key)
            case "dps011": print("트레")
                resultView(key)
            case "dps012": print("솜")
                resultView(key)
            case "dps020": print("메이")
                resultView(key)
            case "dps021": print("벤쳐")
                resultView(key)
            case "dps100": print("솔져")
                resultView(key)
            case "dps101": print("소전")
                resultView(key)
            case "dps102": print("바스")
                resultView(key)
            case "dps110": print("바스")
                resultView(key)
            case "dps111": print("톨비")
                resultView(key)
            case "dps120": print("리퍼")
                resultView(key)
            case "dps121": print("정크")
                resultView(key)
            case "dps200": print("캐서디")
                resultView(key)
            case "dps201": print("한조")
                resultView(key)
            case "dps210": print("위도우")
                resultView(key)
            case "dps211": print("애쉬")
                resultView(key)
            case "healer00": print("루시우")
                resultView(key)
            case "healer01": print("키리")
                resultView(key)
            case "healer10": print("멜시")
                resultView(key)
            case "healer11": print("위버")
                resultView(key)
            case "healer12": print("브리")
                resultView(key)
            case "healer20": print("모이라")
                resultView(key)
            case "healer21": print("바티")
                resultView(key)
            case "healer22": print("일리")
                resultView(key)
            case "healer30": print("아나")
                resultView(key)
            case "healer31": print("젠야타")
                resultView(key)
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
