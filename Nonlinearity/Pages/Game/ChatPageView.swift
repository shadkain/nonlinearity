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
    let chat = Chat()
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hex(rgb: 0x191919)
        
        setupHeaderView()
        setupTableView()
        
        [headerView, tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        constraint()
    }
    
    private func constraint() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: 88),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupHeaderView() {
        headerView.backgroundColor = .hex(rgb: 0x252525)
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        
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
        
//        tableView.pin
//            .horizontally()
//            .below(of: headerView)
//            .bottom(400)
    }
}

extension ChatPageView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rcell") as! RightMessageCell
        
        cell.maxWidth = view.bounds.width - 85
        cell.configure(with: chat.messages[indexPath.row])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat.messages.count
    }
}
