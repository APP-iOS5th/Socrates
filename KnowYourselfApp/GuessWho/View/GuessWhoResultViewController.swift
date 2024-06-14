//
//  GuessWhoResultViewController.swift
//  KnowYourselfApp
//
//  Created by seokyung on 6/4/24.
//

import UIKit

class GuessWhoResultViewController: UIViewController {
    private let imageSaver = ImageSaver()
    
    let resultLabel = UILabel()
    let urLabel = UILabel()
    var resultText: String?
    var resultImageName: String?
    let retryButton = UIButton(type: .system)
    let shareBtn = UIButton(type: .system)
    let saveBtn = UIButton(type: .system)
    let resultImageView = UIImageView()
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    private func setupUI() {
        backgroundImageView.image = UIImage(named: "GuessWhoBG")
        backgroundImageView.contentMode = .scaleAspectFill
        
        urLabel.font = UIFont(name: "HakgyoansimDoldamB", size: 23)
        urLabel.text = "당신은"
        urLabel.textColor = .white
        resultLabel.text = resultText
        resultLabel.font = UIFont(name: "HakgyoansimDoldamB", size: 35)
        resultLabel.textColor = .white
        
        resultImageView.image = UIImage(named: resultImageName ?? "")
        resultImageView.contentMode = .scaleAspectFit
        
        setupButton(retryButton, title: "다시하기")
        setupButton(shareBtn, title: "공유")
        setupButton(saveBtn, title: "저장")
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        urLabel.translatesAutoresizingMaskIntoConstraints = false
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(resultImageView)
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(urLabel)
        view.addSubview(resultLabel)
        view.addSubview(retryButton)
        view.addSubview(shareBtn)
        view.addSubview(saveBtn)
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            urLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            urLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
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
    
    private func setupButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "HakgyoansimDoldamB", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupActions() {
        retryButton.addTarget(self, action: #selector(retryQuiz), for: .touchUpInside)
        
        saveBtn.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            if let capturedImage = self.captureView() {
                self.imageSaver.saveImage(capturedImage, target: self, handler: {
                    let alert = UIAlertController(title: "이미지 저장 완료", message: "이미지가 사진 앨범에 저장되었습니다.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                })
            }
        }, for: .touchUpInside)
        
        shareBtn.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            if let capturedImage = self.captureView() {
                let activityViewController = UIActivityViewController(activityItems: [capturedImage], applicationActivities: nil)
                self.present(activityViewController, animated: true, completion: nil)
            }
        }, for: .touchUpInside)
    }
    
    // 뷰 캡쳐하기
    private func captureView() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        return renderer.image { ctx in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
    }
    
    @objc private func retryQuiz() {
        if let navigationController = navigationController {
            let mainViewController = MainViewController()
            let newQuizViewController = GuessWhoViewController(quizList: quizList)
            navigationController.setViewControllers([mainViewController, newQuizViewController], animated: true)
        }
    }
}
