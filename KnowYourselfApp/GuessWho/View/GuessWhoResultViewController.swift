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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        urLabel.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        urLabel.text = "당신은"
        resultLabel.text = resultText
        resultLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        urLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(urLabel)
        view.addSubview(resultLabel)
        
        resultImageView.image = UIImage(named: resultImageName ?? "")
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
        resultImageView.contentMode = .scaleAspectFit
        view.addSubview(resultImageView)
        
        var config = UIButton.Configuration.filled()
        config.title = "다시하기"
        config.baseBackgroundColor = .systemBlue
        config.cornerStyle = .medium
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        retryButton.configuration = config
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        retryButton.addTarget(self, action: #selector(retryQuiz), for: .touchUpInside)
        view.addSubview(retryButton)

        view.backgroundColor = .white

        NSLayoutConstraint.activate([
            urLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            urLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            resultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: urLabel.bottomAnchor, constant: 20),
            
            resultImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            resultImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            resultImageView.widthAnchor.constraint(equalToConstant: 300),
            resultImageView.heightAnchor.constraint(equalToConstant: 300),
            
            retryButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            retryButton.widthAnchor.constraint(equalToConstant: 100),
            retryButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func retryQuiz() {
        if let navigationController = navigationController {
            let mainViewController = MainViewController()
            let newQuizViewController = ThirdTestViewController(quizList: quizList)
            navigationController.setViewControllers([mainViewController, newQuizViewController], animated: true)
        }
    }
}
