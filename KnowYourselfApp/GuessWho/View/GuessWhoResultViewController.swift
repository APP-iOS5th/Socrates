//
//  GuessWhoResultViewController.swift
//  KnowYourselfApp
//
//  Created by seokyung on 6/4/24.
//

import UIKit

class GuessWhoResultViewController: UIViewController {
    let resultLabel = UILabel()
    let urLabel = UILabel()
    var resultText: String?
    var resultImageName: String?
    let retryButton = UIButton()
    let resultImageView = UIImageView()
    let backgroundImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        backgroundImageView.image = UIImage(named: "GuessWhoBG")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        urLabel.font = UIFont(name: "HakgyoansimDoldamM", size: 23)
        urLabel.text = "당신은"
        urLabel.textColor = .white
        resultLabel.text = resultText
        resultLabel.font = UIFont(name: "HakgyoansimDoldamM", size: 35)
        resultLabel.textColor = .white
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        urLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(urLabel)
        view.addSubview(resultLabel)
        
        resultImageView.image = UIImage(named: resultImageName ?? "")
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
        resultImageView.contentMode = .scaleAspectFit
        view.addSubview(resultImageView)
        
        retryButton.setTitle("다시하기", for: .normal)
        retryButton.setTitleColor(.white, for: .normal)
        retryButton.backgroundColor = .black
        retryButton.layer.cornerRadius = 8
        retryButton.titleLabel?.font = UIFont(name: "HakgyoansimDoldamM", size: 20)
        retryButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        retryButton.addTarget(self, action: #selector(retryQuiz), for: .touchUpInside)
        view.addSubview(retryButton)

        view.backgroundColor = .white

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            urLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            urLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            resultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: urLabel.bottomAnchor, constant: 20),
            
            resultImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            resultImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            resultImageView.widthAnchor.constraint(equalToConstant: 300),
            resultImageView.heightAnchor.constraint(equalToConstant: 300),
            
            retryButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            retryButton.widthAnchor.constraint(equalToConstant: 120),
            retryButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func retryQuiz() {
        if let navigationController = navigationController {
            let mainViewController = MainViewController()
            let newQuizViewController = GuessWhoViewController(quizList: quizList)
            navigationController.setViewControllers([mainViewController, newQuizViewController], animated: true)
        }
    }
}
