//
//  GuessWhoResultViewController.swift
//  KnowYourselfApp
//
//  Created by seokyung on 6/4/24.
//

import UIKit

class GuessWhoResultViewController: UIViewController {
    private let imageSaver = ImageSave()
    
    let resultLabel = UILabel()
    let urLabel = UILabel()
    var resultText: String?
    var resultImageName: String?
    let retryButton = UIButton()
    let shareBtn = UIButton()
    let saveBtn = UIButton()
    let resultImageView = UIImageView()
    let backgroundImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        handlerSaveImage()
        handlerShareImage()
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
        
        shareBtn.setTitle("공유", for: .normal)
        shareBtn.setTitleColor(.white, for: .normal)
        shareBtn.backgroundColor = .black
        shareBtn.layer.cornerRadius = 8
        shareBtn.titleLabel?.font = UIFont(name: "HakgyoansimDoldamM", size: 20)
        shareBtn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        shareBtn.translatesAutoresizingMaskIntoConstraints = false
        
        saveBtn.setTitle("저장", for: .normal)
        saveBtn.setTitleColor(.white, for: .normal)
        saveBtn.backgroundColor = .black
        saveBtn.layer.cornerRadius = 8
        saveBtn.titleLabel?.font = UIFont(name: "HakgyoansimDoldamM", size: 20)
        saveBtn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(retryButton)
        view.addSubview(shareBtn)
        view.addSubview(saveBtn)
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
            resultImageView.widthAnchor.constraint(equalToConstant: 250),
            resultImageView.heightAnchor.constraint(equalToConstant: 250),
            
            retryButton.topAnchor.constraint(equalTo: resultImageView.bottomAnchor, constant: 50),
            retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            retryButton.widthAnchor.constraint(equalToConstant: 120),
            retryButton.heightAnchor.constraint(equalToConstant: 50),
            
            saveBtn.topAnchor.constraint(equalTo: retryButton.bottomAnchor, constant: 20),
            saveBtn.leadingAnchor.constraint(equalTo: resultImageView.leadingAnchor),
            saveBtn.widthAnchor.constraint(equalToConstant: 120),
            saveBtn.heightAnchor.constraint(equalToConstant: 50),
            
            shareBtn.centerYAnchor.constraint(equalTo: saveBtn.centerYAnchor),
            shareBtn.trailingAnchor.constraint(equalTo: resultImageView.trailingAnchor),
            shareBtn.widthAnchor.constraint(equalToConstant: 120),
            shareBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // 이미지 저장
    private func handlerSaveImage() {
        saveBtn.addAction(UIAction { [weak self] _ in
            guard let image = self?.resultImageView.image else { return }
            self?.imageSaver.saveImage(image, target: self, handler: {
                let alert = UIAlertController(title: "이미지 저장 완료", message: "이미지가 사진 앨범에 저장되었습니다.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            })
        }, for: .touchUpInside)
    }
    
    // 이미지 공유하기
    private func handlerShareImage() {
        shareBtn.addAction(UIAction { [weak self] _ in
            guard let image = self?.resultImageView.image else { return }
            let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self?.present(activityViewController, animated: true, completion: nil)
        }, for: .touchUpInside)
    }

    @objc private func retryQuiz() {
        if let navigationController = navigationController {
            let mainViewController = MainViewController()
            let newQuizViewController = GuessWhoViewController(quizList: quizList)
            navigationController.setViewControllers([mainViewController, newQuizViewController], animated: true)
        }
    }
}
