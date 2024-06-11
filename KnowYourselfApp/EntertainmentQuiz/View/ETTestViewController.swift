
import UIKit
import Combine

class ETTestViewController: UIViewController {
    
    var actorData: [EntertainmentModel]
    private var viewModel: ETQuizViewModel
    private var cancellables = Set<AnyCancellable>()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private let actorImage: UIImageView = {
        let actorImage = UIImageView()
        actorImage.contentMode = .scaleAspectFit
        actorImage.translatesAutoresizingMaskIntoConstraints = false
        
        return actorImage
    }()
    
    private let audioPlayer: UIButton = {
        let audioPlayer = UIButton(type: .system)
        audioPlayer.contentMode = .scaleAspectFit
        audioPlayer.setImage(UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 60)), for: .normal)
        audioPlayer.tintColor = .black
        audioPlayer.translatesAutoresizingMaskIntoConstraints = false
        
        return audioPlayer
    }()
    
    private let answerLabel: UILabel = {
        let answerLabel = UILabel()
        answerLabel.font = UIFont.systemFont(ofSize: 16)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return answerLabel
    }()
    
    private let answerTextField: UITextField = {
        let answerTextField = UITextField()
        answerTextField.placeholder = "정답을 입력해주세요."
        answerTextField.borderStyle = .roundedRect
        answerTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return answerTextField
    }()
    
    private let submitBtn: UIButton = {
        let submitBtn = UIButton(type: .custom)
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.title = "입력"
        config.baseBackgroundColor = .systemGray4
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        submitBtn.configuration = config
        submitBtn.translatesAutoresizingMaskIntoConstraints = false
        
        return submitBtn
    }()
    
    private let nextButton: UIButton = {
        let nextButton = UIButton(type: .custom)
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.title = "다음"
        config.image = UIImage(systemName: "arrowshape.forward.fill")
        config.imagePadding = 8
        config.baseBackgroundColor = .systemGray4
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        nextButton.configuration = config
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        return nextButton
    }()
    
    // tap제스쳐
    lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHanlder))
    
    // 초기화
    init(entertainmetnData: [EntertainmentModel]) {
        self.actorData = entertainmetnData
        self.viewModel = ETQuizViewModel(entertainmentData: entertainmetnData)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindingData()
    }
    
    // Memory TapGestures
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        self.view.addGestureRecognizer(tapGesture)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.removeGestureRecognizer(tapGesture)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // setupUI
    private func setupUI() {
        self.title = "Entertainment Quiz"
        self.view.backgroundColor = .white
        
        // Tap Gesture
        self.view.addGestureRecognizer(tapGesture)
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(actorImage)
        self.view.addSubview(audioPlayer)
        self.view.addSubview(answerLabel)
        self.view.addSubview(answerTextField)
        self.view.addSubview(submitBtn)
        self.view.addSubview(nextButton)
        
        nextButton.isHidden = true
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: actorImage.topAnchor, constant: -40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            actorImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -80),
            actorImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            actorImage.widthAnchor.constraint(equalToConstant: 250),
            actorImage.heightAnchor.constraint(equalToConstant: 250),
            
            audioPlayer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -80),
            audioPlayer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            audioPlayer.widthAnchor.constraint(equalToConstant: 250),
            audioPlayer.heightAnchor.constraint(equalToConstant: 250),
            
            answerTextField.topAnchor.constraint(equalTo: actorImage.bottomAnchor, constant: 40),
            answerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerTextField.widthAnchor.constraint(equalToConstant: 300),
            
            submitBtn.topAnchor.constraint(equalTo: answerTextField.bottomAnchor, constant: 20),
            submitBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            answerLabel.topAnchor.constraint(equalTo: submitBtn.bottomAnchor, constant: 20),
            answerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextButton.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // UIActions
        setupActions()
    }
    
    private func setupActions() {
        submitBtn.addAction(UIAction { [weak self] _ in
            self?.checkAnswer()
        }, for: .touchUpInside)
        
        nextButton.addAction(UIAction { [weak self] _ in
            self?.nextQuiz()
        }, for: .touchUpInside)
        
        audioPlayer.addAction(UIAction { [weak self] _ in
            self?.playAudio()
        }, for: .touchUpInside)
    }
    
    // Bind
    private func bindingData() {
        viewModel.$currentQuiz
            .receive(on: DispatchQueue.main)
            .sink { [weak self] quiz in
                self?.titleLabel.text = quiz.title
                self?.answerTextField.text = ""
                self?.answerLabel.text = ""
                self?.nextButton.isHidden = true
                
                if let imageUrl = quiz.image, let url = URL(string: imageUrl) {
                    self?.actorImage.load(url: url)
                    self?.actorImage.isHidden = false
                } else {
                    self?.actorImage.isHidden = true
                }
                
                self?.audioPlayer.isHidden = quiz.audio == nil
                self?.resetAudio()
            }
            .store(in: &cancellables)
    }
    
    // 정답체크
    private func checkAnswer() {
        guard let answer = answerTextField.text, !answer.isEmpty else { return }
        let isCorrect = viewModel.checkAnswer(answer)
        answerLabel.text = isCorrect ? "정답입니다!" : "틀렸습니다. 정답: \(viewModel.currentQuiz.answer)"
        answerLabel.textColor = isCorrect ? .systemGreen : .systemRed
        nextButton.isHidden = false
    }
    
    // 다음질문
    private func nextQuiz() {
        viewModel.nextQuiz()
        if viewModel.isQuizCompleted {
            let viewControllerToPresent = ETResultViewController()
            viewControllerToPresent.totalQuestions = actorData.count
            viewControllerToPresent.correctAnswers = viewModel.correctAnswers
            self.navigationController?.popToRootViewController(animated: true)
            self.present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
    
    // 오디오 재생
    private func playAudio() {
        if viewModel.isPlayed {
            viewModel.stopAudio()
            audioPlayer.setImage(UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 60)), for: .normal)
            audioPlayer.tintColor = .black
        } else {
            viewModel.playAudio()
            audioPlayer.setImage(UIImage(systemName: "stop.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 60)), for: .normal)
            audioPlayer.tintColor = .systemGray
        }
    }
    
    // 오디오 버튼 초기화
    private func resetAudio() {
        audioPlayer.setImage(UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 60)), for: .normal)
        audioPlayer.tintColor = .black
    }
    
    // Tap Hanlder
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardHeight
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
    
    @objc func tapHanlder(_ sender: UIView) {
        answerTextField.resignFirstResponder()
    }
}


// 이미지 확장
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}

