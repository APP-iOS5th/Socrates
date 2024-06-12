//
//  GuessWhoProgessView.swift
//  KnowYourselfApp
//
//  Created by seokyung on 6/11/24.
//

import UIKit

class ProgressView: UIView {
    private let progressBar = UIProgressView(progressViewStyle: .default)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(progressBar)
        
        NSLayoutConstraint.activate([
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            progressBar.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setProgress(_ progress: Float) {
        progressBar.setProgress(progress, animated: true)
    }
}
