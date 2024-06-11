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
    private let questionsKeys = Array(questions.keys).sorted()
    private var QLabel: UILabel!
    private var firstButton: UIButton!
    private var secondButton: UIButton!
    private var thirdButton: UIButton!
    private var fourthButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "오버워치 영웅 테스트"
        view.backgroundColor = .white
        
        
        
        QLabel = createLabel(title: questions["tanker1"]!.question)
        
        // 버튼 생성
        firstButton = createButton(
            title: questions["tanker1"]!.anwser1,
            tag: 0,
            target: self,
            action: #selector(heroScoreChanger(_:))
        )
        
        secondButton = createButton(
            title: questions["tanker1"]!.anwser2,
            tag: 1,
            target: self,
            action: #selector(heroScoreChanger(_:))
        )
        
        thirdButton = createButton(
            title: questions["tanker1"]!.anwser3,
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
    private func loadTankerQuestion() {
        let questionKey = questionsKeys[currentQIndex]
        if let questionData = questions[questionKey] {
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
            switch sender.tag {
            case 0: print("a")
            case 1: print("a")
            case 2: print("a")
            default: break
            }
        } 
        if currentQIndex == 3 {
            switch heroScore {
            case 0...1: print("a")
            case 2...3: print("a")
            case 4...6: print("a")
            default: break
            }
        }
            else {
            loadTankerQuestion()
        }
    }
    
    
    
}
