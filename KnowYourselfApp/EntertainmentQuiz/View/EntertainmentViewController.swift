//
//  EntertainmentViewController.swift
//  KnowYourselfApp
//
//  Created by SeongKook on 6/11/24.
//

import UIKit
import Combine

class EntertainmentViewController: UIViewController {
    
    private var EntertainmetnViewModel = EntertainmentViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    var quizList: [EntertainmentModel] = []
    
    private let actorTitleLabel: UILabel = {
        let actorTitleLabel = UILabel()
        actorTitleLabel.text = "Entertainment Game"
        actorTitleLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        actorTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return actorTitleLabel
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        
        return activityIndicator
    }()
    
    private let actorGameStartBtn: UIButton = {
        let actorGameStartBtn = UIButton(type: .custom)
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.title = "시작하기"
        config.baseBackgroundColor = .systemGray4
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        actorGameStartBtn.configuration = config
        actorGameStartBtn.translatesAutoresizingMaskIntoConstraints = false
        
        return actorGameStartBtn
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        setUpData()
    }
    
    func setUp() {
        self.title = "Entertainment"
        self.view.backgroundColor = .white
        
        actorGameStartBtn.addAction(UIAction { [weak self] _ in
            self?.EntertainmetnViewModel.fetchActorData()
            
            let ETTestViewController = ETTestViewController(entertainmetnData: self?.quizList ?? [])
            self?.show(ETTestViewController, sender: nil)
        }, for: .touchUpInside)
        
        setUpUI()
    }
    
    func setUpUI() {
        self.view.addSubview(actorTitleLabel)
        self.view.addSubview(actorGameStartBtn)
        self.view.addSubview(activityIndicator)
        
        
        
        
        NSLayoutConstraint.activate([
            actorTitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            actorTitleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            actorGameStartBtn.topAnchor.constraint(equalTo: actorTitleLabel.bottomAnchor, constant: 50),
            actorGameStartBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            
            
        ])
    }
    
    private func setUpData() {
        EntertainmetnViewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                self?.updateUI(isLoading: isLoading)
            }
            .store(in: &cancellables)
        
        EntertainmetnViewModel.$entertainmentData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] data in
                self?.quizList = data
            }
            .store(in: &cancellables)
        
        EntertainmetnViewModel.fetchActorData()
        
    }
    
    private func updateUI(isLoading: Bool) {
        actorTitleLabel.isHidden = isLoading
        actorGameStartBtn.isHidden = isLoading
        if isLoading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
