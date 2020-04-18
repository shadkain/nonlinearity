//
//  ChatPage.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 08.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

class ChatPageView: UIViewController {
    private let headerView = UIView()
    private let tableView = UITableView()
    let rightCellTemplate = RightMessageCell()
    let chat = Chat()
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hex(rgb: 0x191919)
        
        setupHeaderView()
        setupTableView()
        
        [headerView, tableView].forEach { view.addSubview($0) }
    }
    
    private func setupHeaderView() {
        headerView.backgroundColor = .hex(rgb: 0x252525)
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(RightMessageCell.self, forCellReuseIdentifier: "rcell")
    }
    
    override func viewDidLayoutSubviews() {
        print("view did layout")
        headerView.pin
            .top()
            .horizontally()
            .height(88)
        
        tableView.pin
            .horizontally()
            .below(of: headerView)
            .bottom(400)
    }
}

extension ChatPageView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rcell", for: indexPath) as! RightMessageCell
        
        cell.messageView.configure(with: chat.messages[indexPath.row], location: .right)
        cell.messageView.maxWidth = view.frame.width - 85
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        rightCellTemplate.messageView.configure(with: chat.messages[indexPath.row], location: .right)
        
        let g = rightCellTemplate.sizeThatFits(.init(width: view.frame.width - 85, height: .greatestFiniteMagnitude))
        print("estimate for \(indexPath.row): \(g)")
        
        return g.height
    }
}
