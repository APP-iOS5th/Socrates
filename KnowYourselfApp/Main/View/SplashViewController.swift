//
//  SplashViewController.swift
//  KnowYourselfApp
//
//  Created by SeongKook on 6/11/24.
//

import UIKit

import UIKit

class SplashViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "SplashImage"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 2초 후에 메인 화면으로 전환
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showMainView()
        }
    }
    
    func setUp() {
        self.view.backgroundColor = UIColor(red: 255/255, green: 233/255, blue: 211/255, alpha: 1)
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func showMainView() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate,
              let window = sceneDelegate.window else {
            return
        }
        
        let firstViewController = UINavigationController(rootViewController: MainViewController())
        let secondViewController = UINavigationController(rootViewController: EntertainmentViewController())
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstViewController, secondViewController], animated: true)
        
        if let items = tabBarController.tabBar.items {
            items[0].selectedImage = UIImage(systemName: "brain.fill")
            items[0].image = UIImage(systemName: "brain")
            items[0].title = "심리테스트"
            
            items[1].selectedImage = UIImage(systemName: "brain.head.profile.fill")
            items[1].image = UIImage(systemName: "brain.head.profile")
            items[1].title = "배우 맞추기"
        }
        
        window.rootViewController = tabBarController
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}

