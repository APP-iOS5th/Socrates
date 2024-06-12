//
//  ViewController.swift
//  Know Yourself
//
//  Created by 김형준 on 5/31/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let tableView = UITableView()
    var selectedCell: CustomTableViewCell?
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "KNOW YOURSELF"
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = view.frame.size.height / 4.7
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
    }
    
    // 각 인덱스별 이미지 이름 배열

    let prevImages: [String] = ["main", "Ttest", "GuessWho1", "aaa"]
    let nextImages: [String] = ["main2", "Ttest_CH_main", "GuessWho2", "bbb"]

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
                return UITableViewCell()
            }
        cell.entryButton.isHidden = true
        cell.cellImageView.image = UIImage(named: prevImages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            guard let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell else { return }
            
            // 이전에 선택된 셀의 이미지와 버튼 상태를 원래대로 되돌림
            if let previousIndexPath = selectedIndexPath, let preCell = tableView.cellForRow(at: previousIndexPath) as? CustomTableViewCell {
                preCell.entryButton.isHidden = true
                preCell.cellImageView.image = UIImage(named: prevImages[previousIndexPath.row])
            }
            
            // 현재 선택된 셀의 이미지와 버튼 상태를 업데이트
            cell.entryButton.isHidden = false
            UIView.transition(with: cell.cellImageView,
                              duration: 0.4,
                              options: .transitionCrossDissolve,
                              animations: {
                cell.cellImageView.image = UIImage(named: self.nextImages[indexPath.row])
                              })
            setEntryButtonTarget(for: cell, indexPath: indexPath)
            
            // 선택된 셀과 인덱스 경신
            selectedCell = cell
            selectedIndexPath = indexPath
        }
    
    func setEntryButtonTarget(for cell: CustomTableViewCell, indexPath: IndexPath) {
        cell.entryButton.removeTarget(nil, action: nil, for: .allEvents)
        cell.entryButton.addAction(UIAction { _ in
            self.buttonTapped(indexPath)
        }, for: .touchUpInside)
    }
    
    func buttonTapped(_ indexPath: IndexPath) {
        
        let first = FirstTestViewController()
        let second = TBalTestViewController()
        let third = GuessWhoViewController(quizList: quizList)
        let fourth = FourthTestViewController()
        let TestViewGroup = [first, second, third, fourth]

        navigationController?.pushViewController(TestViewGroup[indexPath.row], animated: true)
    }
    
}

