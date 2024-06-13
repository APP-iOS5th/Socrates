//
//  DinnerGenieResultViewController.swift
//  KnowYourselfApp
//
//  Created by 김소희 on 6/12/24.
//

import UIKit
import Photos

class DinnerGenieResultViewController: UIViewController {
    
    private var viewModel = DinnerGenieViewModel()
    private var imageSaver = SaveJpeg()
    init(viewModel: DinnerGenieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 저녁 추천 메뉴는?"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 20)
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
        label.font = UIFont(name: "Pretendard-SemiBold", size: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reRecommendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("재추천", for: .normal)
        button.titleLabel?.font = UIFont(name: "MangoByeolbyeol", size: 15)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(reRecommendButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("공유", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("저장", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let homeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다른 테스트 하러가기", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 15)
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
        updateUI()
        setupActions()
        
        let recommendedMenu = viewModel.recommendedMenu
        resultImageView.image = UIImage(named: recommendedMenu[0])
        resultLabel.text = "추천 메뉴: \(recommendedMenu[1])"
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        resultImageView.isUserInteractionEnabled = true
        resultImageView.addGestureRecognizer(tapGestureRecognizer)
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
            
            shareButton.topAnchor.constraint(equalTo: reRecommendButton.bottomAnchor, constant: 15),
            shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            shareButton.widthAnchor.constraint(equalToConstant: 130),
            shareButton.heightAnchor.constraint(equalToConstant: 45),
            
            saveButton.topAnchor.constraint(equalTo: shareButton.topAnchor),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            saveButton.widthAnchor.constraint(equalToConstant: 130),
            saveButton.heightAnchor.constraint(equalToConstant: 45),
            
            homeButton.topAnchor.constraint(equalTo: reRecommendButton.bottomAnchor, constant: 75),
            homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeButton.widthAnchor.constraint(equalToConstant: 150),
            homeButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func updateUI() {
        let recommendedMenu = viewModel.recommendedMenu
        resultImageView.image = UIImage(named: recommendedMenu[0])
        resultLabel.text = "추천 메뉴: \(recommendedMenu[1])"
    }
    
    private func setupActions() {
        shareButton.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            if let capturedImage = self.captureView() {
                let activityViewController = UIActivityViewController(activityItems: [capturedImage], applicationActivities: nil)
                self.present(activityViewController, animated: true, completion: nil)
            }
        }, for: .touchUpInside)
        
        saveButton.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            if let capturedImage = self.captureView() {
                self.imageSaver.saveImage(capturedImage, target: self, handler: {
                    let alert = UIAlertController(title: "이미지 저장 완료", message: "이미지가 사진 앨범에 저장되었습니다.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                })
            }
        }, for: .touchUpInside)
        
        homeButton.addAction(UIAction { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        }, for: .touchUpInside)
    }
    
    private func captureView() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        return renderer.image { ctx in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
    }
    
    @objc private func imageViewTapped(_ sender: UITapGestureRecognizer) {
        if let url = URL(string: "baemin://"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            if let appStoreURL = URL(string: "https://www.baemin.com/") {
                UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    @objc private func reRecommendButtonTapped() {
        updateUI()
    }
    
    private func checkPhotosPermission(completion: @escaping (Bool) -> Void) {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAuthorizationStatus {
        case .authorized:
            completion(true)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                completion(status == .authorized)
            }
        case .restricted, .denied:
            completion(false)
        default:
            break
        }
    }
    
    private func presentPhotosPermissionAlert() {
        let alertController = UIAlertController(title: "사진첩 접근 권한 필요", message: "사진첩에 이미지를 저장하려면 사진첩 접근 권한이 필요합니다. 설정에서 권한을 허용해주세요.", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "설정", style: .default) { _ in
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsURL)
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(settingsAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func renderViewToImage(size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            view.drawHierarchy(in: CGRect(origin: .zero, size: size), afterScreenUpdates: true)
        }
    }
    
    @objc private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        DispatchQueue.main.async {
            if let error = error {
                let imageAlert = UIAlertController(title: "저장 에러", message: error.localizedDescription, preferredStyle: .alert)
                imageAlert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(imageAlert, animated: true)
            } else {
                let imageAlert = UIAlertController(title: "저장", message: "이미지가 사진첩에 저장되었습니다.", preferredStyle: .alert)
                imageAlert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(imageAlert, animated: true)
            }
        }
    }
    private func updateResult() {
        
    }
}
