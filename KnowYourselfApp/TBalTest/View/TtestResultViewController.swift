import UIKit

class TtestResultViewController: UIViewController {
    
    // ViewModel
    private let viewModel: TtestViewModel
    
    // ImageSaver
    private let imageSaver = ImageSaver()
    
    // ScrollView
    private let resultScrollView: UIScrollView = {
        let resultScrollView = UIScrollView()
        resultScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return resultScrollView
    }()
    
    // ContentView
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentView
    }()
    
    // ImageView
    private let resultImageView: UIImageView = {
        let resultImageView = UIImageView()
        resultImageView.contentMode = .scaleAspectFit
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
        return resultImageView
    }()
    
    // StackView
    private let resultStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 버튼 재사용
    private let saveBtn: UIButton = UIButton.customBtn(title: "이미지 저장")
    private let shareBtn: UIButton = UIButton.customBtn(title: "공유하기")
    private let reTestBtn: UIButton = UIButton.customBtn(title: "다른 테스트하기")
    
    // 초기화
    init(viewModel: TtestViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        handlerMoveMain()
        handlerShareImage()
        handlerSaveImage()
    }
    
    // 결과창에서 뒤로가기 시 중첩되는 오류 발생 - 해결: ViewController가 뒤로가기버튼으로 사라질때 reset()함수 실행
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        /*
         isMovingFromParent -  뷰 컨트롤러가 네비게이션 스택이나 부모 컨테이너에서 제거되고 있는지 확인
         isBeingDismissed - 뷰 컨트롤러가 현재 모달로 표시된 상태에서 해제되고 있는지 확인
         */
        if self.isMovingFromParent || self.isBeingDismissed {
            viewModel.reset()
        }
    }
    
    // UI SetUp
    func setupUI() {
        self.title = "Result"
        self.view.backgroundColor = .white
        
        scoreImage()
        
        self.view.addSubview(resultScrollView)
        resultScrollView.addSubview(contentView)
        
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            resultScrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            resultScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            resultScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            resultScrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: resultScrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: resultScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: resultScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: resultScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: resultScrollView.widthAnchor),
        ])
        imageSetUp()
        stackSetUp()
    }
    
    // Image SetUp
    private func imageSetUp() {
        contentView.addSubview(resultImageView)
        
        NSLayoutConstraint.activate([
            resultImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            resultImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            resultImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            resultImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    // Stack SetUp
    private func stackSetUp() {
        contentView.addSubview(resultStackView)
        resultStackView.addArrangedSubview(saveBtn)
        resultStackView.addArrangedSubview(shareBtn)
        resultStackView.addArrangedSubview(reTestBtn)
        
        NSLayoutConstraint.activate([
            resultStackView.topAnchor.constraint(equalTo: resultImageView.bottomAnchor),
            resultStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            resultStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            resultStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            saveBtn.trailingAnchor.constraint(equalTo: resultStackView.trailingAnchor),
            saveBtn.leadingAnchor.constraint(equalTo: resultStackView.leadingAnchor),
            
            shareBtn.trailingAnchor.constraint(equalTo: resultStackView.trailingAnchor),
            shareBtn.leadingAnchor.constraint(equalTo: resultStackView.leadingAnchor),
            
            reTestBtn.trailingAnchor.constraint(equalTo: resultStackView.trailingAnchor),
            reTestBtn.leadingAnchor.constraint(equalTo: resultStackView.leadingAnchor)
        ])
    }
    
    // TotalScore -> Image
    private func scoreImage() {
        switch viewModel.totalScore {
        case 0:
            resultImageView.image = UIImage(named: "Tresult01")
        case 1...30:
            resultImageView.image = UIImage(named: "Tresult02")
        case 31...50:
            resultImageView.image = UIImage(named: "Tresult03")
        case 51...80:
            resultImageView.image = UIImage(named: "Tresult04")
        case 81...100:
            resultImageView.image = UIImage(named: "Tresult05")
        default:
            print("Error: Score error!")
        }
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
    
    // 다른 테스트 Main으로 뷰 이동
    private func handlerMoveMain() {
        reTestBtn.addAction(UIAction { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        }, for: .touchUpInside)
    }
}

// Custom Button
extension UIButton {
    static func customBtn(title: String) -> UIButton {
        let button = UIButton(type: .custom)
        var config = UIButton.Configuration.filled()
        config.title = title
        config.baseBackgroundColor = .black
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        
        button.configuration = config
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
}
