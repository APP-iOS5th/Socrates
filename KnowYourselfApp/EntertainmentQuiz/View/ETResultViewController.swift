


import UIKit

class ETResultViewController: UIViewController {
    var totalQuestions: Int = 0
    var correctAnswers: Int = 0
    
    private let resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return resultLabel
    }()
    
    private let retrybtn: UIButton = {
        let retrybtn = UIButton(type: .custom)
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.title = "다시하기"
        config.baseBackgroundColor = .systemGray4
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        retrybtn.configuration = config
        retrybtn.translatesAutoresizingMaskIntoConstraints = false
        
        return retrybtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    func setUpUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(resultLabel)
        self.view.addSubview(retrybtn)
        
        resultLabel.text = "총 \(totalQuestions) 문제 중 \(correctAnswers) 문제를 맞추셨습니다."
        
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            retrybtn.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 40),
            retrybtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        handlerRetry()
    }
    private func handlerRetry() {
        retrybtn.addAction(UIAction { [weak self] _ in
            self?.dismiss(animated: true)
        }, for: .touchUpInside)
    }
}

