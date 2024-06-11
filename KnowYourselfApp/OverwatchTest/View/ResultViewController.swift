////
////  ResultViewController.swift
////  KnowYourselfApp
////
////  Created by 김형준 on 6/11/24.
////
//
//import UIKit
//
//class ResultViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // 배경 색상 설정 (필요에 따라 변경)
//        view.backgroundColor = .white
//
//        // 이미지 뷰 생성 및 설정
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(named: "yourImageName") // 에셋에 추가한 이미지 이름
//
//        // 텍스트 레이블 생성 및 설정
//        let resultLabel = UILabel()
//        resultLabel.translatesAutoresizingMaskIntoConstraints = false
//        resultLabel.text = "Your result text goes here."
//        resultLabel.font = .systemFont(ofSize: 18, weight: .regular)
//        resultLabel.textColor = .black
//        resultLabel.textAlignment = .center
//        resultLabel.numberOfLines = 0
//
//        // 뷰에 이미지 뷰 및 레이블 추가
//        view.addSubview(imageView)
//        view.addSubview(resultLabel)
//
//        // 오토레이아웃 설정
//        NSLayoutConstraint.activate([
//            // 이미지 뷰 제약 조건
//            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
//            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8), // 이미지 비율 유지
//
//            // 레이블 제약 조건
//            resultLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
//            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//        ])
//    }
//}
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
