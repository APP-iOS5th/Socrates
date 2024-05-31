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

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
                return UITableViewCell()
            }
        cell.entryButton.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell else { return }
        if let preCell = selectedCell {
            preCell.entryButton.isHidden = true
            preCell.cellImageView.image = UIImage(named: "aaa")
        }
        cell.entryButton.isHidden = false
        UIView.transition(with: cell.cellImageView,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: ({cell.cellImageView.image = UIImage(named: "bbb") }))
        setEntryButtonTarget(for: cell, indexPath: indexPath)
        selectedCell = cell
    }
    
    func setEntryButtonTarget(for cell: CustomTableViewCell, indexPath: IndexPath) {
        cell.entryButton.removeTarget(nil, action: nil, for: .allEvents)
        cell.entryButton.addAction(UIAction{ _ in
            self.buttonTapped(indexPath)
        }, for: .touchUpInside)
    }
    
    func buttonTapped(_ indexPath: IndexPath) {
        
        let first = FirstTestViewController()
        let second = SecondTestViewController()
        let third = ThirdTestViewController()
        let fourth = FourthTestViewController()
        let TestViewGroup = [first, second, third, fourth]

        navigationController?.pushViewController(TestViewGroup[indexPath.row], animated: true)
    }
    
}

