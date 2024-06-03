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
    }
}
