//
//  TableViewCell.swift
//  Know Yourself
//
//  Created by 김형준 on 5/31/24.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func CustomCellButtonDidTapped(_ cell: CustomTableViewCell, isTapped: Bool)
}

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    let cellImageView: UIImageView = {
        let imageview = UIImageView()
        // imageview.image = UIImage(named: "aaa")
        imageview.contentMode = .scaleAspectFill
        imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius = 30
        return imageview
    }()
    
    let entryButton: UIButton = {
        let button = UIButton(type: .custom)
        var config = UIButton.Configuration.filled()
        config.title = "입장"
        config.baseBackgroundColor = .black
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        config.cornerStyle = .capsule
        
        button.configuration = config
        // button.layer.cornerRadius = 20
        button.isHidden = true
        return button
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellImageView)
        contentView.addSubview(entryButton)
        
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        entryButton.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            cellImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            cellImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.93),
            
            entryButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            entryButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            entryButton.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.4)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
