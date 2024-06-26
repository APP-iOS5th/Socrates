//
//  SecondTestViewController.swift
//  Know Yourself
//
//  Created by 김형준 on 5/31/24.
//

import UIKit
import Foundation

func createLabel(title: String) -> UILabel {
    let label = UILabel()
    label.font = .systemFont(ofSize: 22, weight: .bold)
    label.textColor = .black
    label.textAlignment = .center
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    
    let strokeTextAttributes: [NSAttributedString.Key: Any] = [
        .strokeColor: UIColor.orange,
           .foregroundColor: UIColor.black, // 텍스트 색상
        .strokeWidth: -0.5 //외곽선을 그려줌
       ]

       let attributedText = NSAttributedString(string: title, attributes: strokeTextAttributes)
       label.attributedText = attributedText

       
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}

func createButton(title: String, tag: Int, target: Any?, action: Selector) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.backgroundColor = .darkGray
    button.setTitleColor(.orange, for: .normal)
    button.titleLabel?.numberOfLines = 0
    button.titleLabel?.lineBreakMode = .byWordWrapping
    button.titleLabel?.font = .systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
    button.contentHorizontalAlignment = .center
    button.contentVerticalAlignment = .center
    button.tag = tag
    button.addTarget(target, action: action, for: .touchUpInside)
    button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
    button.layer.cornerRadius = 20
    return button
}

class FirstTestViewController: UIViewController {
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 탭바 숨기기
        if self.navigationController?.viewControllers.last == self {
            tabBarController?.tabBar.isHidden = true
        }
    }
    // 탭바 표시하기
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent {
            tabBarController?.tabBar.isHidden = false
            self.navigationController?.navigationBar.backItem?.title = "KNOW YOURSELF"
            self.navigationController?.navigationBar.tintColor = .systemBlue
        }
    }
   
    private var heroScore = 0
    //0~1 딜러, 2~3탱커, 4~6 힐러
    private var currentQIndex = 0
    private let questionsKeys = Array(questions.keys)
    private var currentKeyNow: String! = "main"
    private var QLabel: UILabel!
    private var firstButton: UIButton!
    private var secondButton: UIButton!
    private var thirdButton: UIButton!
    private var fourthButton: UIButton!
    
    
    //여기저기 쓰이는 배경화면
    private lazy var backgroundImageView: UIImageView = {
           let imageView = UIImageView(frame: view.bounds)
           imageView.contentMode = .scaleAspectFit // 이미지 비율 유지 및 화면에 맞춤
           imageView.image = UIImage(named: "backgroundImage") // 배경 이미지 설정
        imageView.alpha = 1.0
           return imageView
       }()
       
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "오버워치 영웅 테스트"
        view.backgroundColor = .white
        
        StartView()
    }
    
    // 첫 시작 화면
    private func StartView() {
        self.title = ""
        
        var button: UIButton = {
            let button = UIButton(type: .custom)
            button.backgroundColor = .blue
            button.setTitle("버튼", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 45
            button.clipsToBounds = true
            if let buttonImage = UIImage(named: "buttonImage") {
                button.setImage(buttonImage, for: .normal)
            }
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            return button
        }()
        
        
        var startLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.textColor = .white
            label.text = "오버워치 영웅 테스트 시작하기"
            return label
        }()
        
        view.backgroundColor = .black
        view.addSubview(backgroundImageView)
        view.addSubview(button)
        view.addSubview(startLabel)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                    backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    backgroundImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -10),
                    button.widthAnchor.constraint(equalToConstant: 90),
                    button.heightAnchor.constraint(equalToConstant: 90),
                    startLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    startLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 35)
                ])
        }
            
    //문제 나오는 화면
    private func setupView() {
        
        view.subviews.forEach { $0.removeFromSuperview() }
        view.backgroundColor = .white
        
        self.title = "오버워치 영웅 테스트"
        self.navigationController?.navigationBar.backItem?.title = "Test List"
        self.navigationController?.navigationBar.tintColor = .black
        
        //배경 그림
        backgroundImageView.image = UIImage(named: "backgroundImage2")
        backgroundImageView.alpha = 0.6
        backgroundImageView.contentMode = .scaleAspectFit

        //질문 생성
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
        
        
        view.addSubview(backgroundImageView)
        view.addSubview(QLabel)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        view.addSubview(fourthButton)
        fourthButton.isHidden = true
        
        NSLayoutConstraint.activate([
            QLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            QLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            QLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: QLabel.bottomAnchor, constant: 100),
            firstButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),
            secondButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 20),
            thirdButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            fourthButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fourthButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: 20),
            fourthButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
            
        ])
       
      
        }
    
    
    //결과 화면
    private func resultView(_ heroNumber: String) {
        view.subviews.forEach { $0.removeFromSuperview() }
        view.backgroundColor = .white
        //배경 이미지
        backgroundImageView.image = UIImage(named: "background3")
        backgroundImageView.alpha = 0.6
        backgroundImageView.contentMode = .scaleAspectFill

        // 영웅 이미지 뷰 생성 및 설정
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "\(heroNumber).jpg")
                
        // 영웅 이름 생성 및 설정
        let nameLabel = UILabel()
        nameLabel.text = heroes[heroNumber]?.name
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        
        //영웅 페이지 이동 로고
        let logoButton = UIButton()
        logoButton.setImage(UIImage(named: "logo"), for: .normal)
        if let filteredName = heroes[heroNumber]?.name {
            let filtered = filteredName.filter { $0.isLetter && $0.unicodeScalars.allSatisfy({ scalar in
                scalar.properties.isAlphabetic && scalar.isASCII
            }) || $0 == "-" }
            
          
            logoButton.addAction(UIAction(handler: { _ in
                self.logoTapped(filtered.lowercased())
            }), for: .touchUpInside)
        }
        
        
        //영웅 정보 텍스트
        let storyText = UILabel()
        storyText.translatesAutoresizingMaskIntoConstraints = false
        storyText.font = .systemFont(ofSize: 18, weight: .semibold)
        storyText.text = heroes[heroNumber]?.story
        storyText.textColor = .black
        storyText.textAlignment = .natural
        storyText.numberOfLines = 0
        
        let positionText = UILabel()
        positionText.translatesAutoresizingMaskIntoConstraints = false
        positionText.font = .systemFont(ofSize: 18, weight: .semibold)
        positionText.text = heroes[heroNumber]?.position
        positionText.textColor = .black
        positionText.textAlignment = .natural
        positionText.numberOfLines = 0
        
        let locationText = UILabel()
        locationText.translatesAutoresizingMaskIntoConstraints = false
        locationText.font = .systemFont(ofSize: 18, weight: .semibold)
        locationText.text = heroes[heroNumber]?.location
        locationText.textColor = .black
        locationText.textAlignment = .natural
        locationText.numberOfLines = 0
        
        let birthText = UILabel()
        birthText.translatesAutoresizingMaskIntoConstraints = false
        birthText.font = .systemFont(ofSize: 18, weight: .semibold)
        birthText.text = heroes[heroNumber]?.birth
        birthText.textColor = .black
        birthText.textAlignment = .natural
        birthText.numberOfLines = 0
        
        
        //영웅 정보 이미지
        let positionImage = UIImageView()
        positionImage.image = UIImage(named: heroNumber.contains("dps") ? "attack.jpg" : (heroNumber.contains("tanker") ? "tank.jpg" : "healer.jpg"))
        
        let locationImage = UIImageView()
        locationImage.image = UIImage(systemName: "location.fill")
        locationImage.tintColor = .white
    
        let birthImage = UIImageView()
        birthImage.image = UIImage(systemName: "birthday.cake.fill")
        birthImage.tintColor = .white
        
        // 공유하기 버튼 생성 및 설정
        let shareButton = UIButton(type: .system)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.setTitle("공유하기", for: .normal)
        shareButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        shareButton.backgroundColor = .darkGray
        shareButton.tintColor = .orange
        shareButton.layer.cornerRadius = 8
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        
        //뷰에 추가
        view.addSubview(backgroundImageView)
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(storyText)
        view.addSubview(positionText)
        view.addSubview(locationText)
        view.addSubview(birthText)
        view.addSubview(positionImage)
        view.addSubview(locationImage)
        view.addSubview(birthImage)
        view.addSubview(logoButton)
        view.addSubview(shareButton)
        
        
        //레이아웃 설정
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        storyText.translatesAutoresizingMaskIntoConstraints = false
        positionText.translatesAutoresizingMaskIntoConstraints = false
        positionImage.translatesAutoresizingMaskIntoConstraints = false
        locationText.translatesAutoresizingMaskIntoConstraints = false
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        birthText.translatesAutoresizingMaskIntoConstraints = false
        birthImage.translatesAutoresizingMaskIntoConstraints = false
        logoButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            logoButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: -110),
            logoButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            logoButton.widthAnchor.constraint(equalToConstant: 50),
            logoButton.heightAnchor.constraint(equalTo: logoButton.widthAnchor, multiplier: (logoButton.imageView?.image?.size.height ?? 1.0) / (logoButton.imageView?.image?.size.width ?? 1.0)),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            storyText.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            storyText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            storyText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            positionImage.topAnchor.constraint(equalTo: storyText.bottomAnchor, constant: 20),
            positionImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            positionImage.widthAnchor.constraint(equalToConstant: 20),
            positionImage.heightAnchor.constraint(equalToConstant: 20),

            positionText.centerYAnchor.constraint(equalTo: positionImage.centerYAnchor),
            positionText.leadingAnchor.constraint(equalTo: positionImage.trailingAnchor, constant: 10),
            positionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            locationImage.topAnchor.constraint(equalTo: positionImage.bottomAnchor, constant: 20),
            locationImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            locationImage.widthAnchor.constraint(equalToConstant: 20),
            locationImage.heightAnchor.constraint(equalToConstant: 20),

            locationText.centerYAnchor.constraint(equalTo: locationImage.centerYAnchor),
            locationText.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 10),
            locationText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            birthImage.topAnchor.constraint(equalTo: locationImage.bottomAnchor, constant: 20),
            birthImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            birthImage.widthAnchor.constraint(equalToConstant: 20),
            birthImage.heightAnchor.constraint(equalToConstant: 20),

            birthText.centerYAnchor.constraint(equalTo: birthImage.centerYAnchor),
            birthText.leadingAnchor.constraint(equalTo: birthImage.trailingAnchor, constant: 10),
            birthText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            shareButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shareButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
    }
    
    
   //문제 넘어갈 때, 다음 문제 선택하는 함수
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
    //선택지 선택할 때 함수
    @objc func heroScoreChanger(_ sender: UIButton) {
        currentQIndex += 1
        heroScore += sender.tag
        
        // 포지션 정해지고 나서 각 키로 돌아가는 상황[기존키 + 태그]
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
        }
        
        //포지션이 정해지는순간-> 각 포지션에 맞는 질문지로 점프 [포지션]
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
        }
        //포지션 정하기전까지 점수 합산
        if currentQIndex < 3 {
            let positionKey = "main" + String(currentQIndex)
            loadDetailQuestion(positionKey)
           
        }
    }
    
    //스타트버튼
    @objc private func buttonTapped() {
        setupView()
    }
    
    //공유 버튼
    @objc func shareButtonTapped() {
        // 공유할 내용 준비
        let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
        let snapshot = renderer.image { context in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        
        
        // 공유 시트 표시
           let activityViewController = UIActivityViewController(activityItems: [snapshot], applicationActivities: nil)
           present(activityViewController, animated: true, completion: nil)
    }
    
    //영웅 페이지 이동
    @objc func logoTapped(_ heroName: String) {
    let urlString = "https://overwatch.blizzard.com/ko-kr/heroes/\(heroName)"
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    
}
