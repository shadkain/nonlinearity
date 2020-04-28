//
//  ChatPage.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 08.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class ChatPageView: UIViewController {
    private let headerView = PersonalHeaderView()
    private let bottomView = BottomView()
    private let tableView = UITableView()
    private var chat: Chat!
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    override var prefersStatusBarHidden: Bool { true }
    
    func configure(with chat: Chat) {
        self.chat = chat
        
        if !chat.isGroup {
            headerView.configure(companion: chat.companions[0], networkStatus: .offline)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hex(rgb: 0x191919)
        
        setupTableView()
        configure(with: .init())
        
        [headerView, tableView, bottomView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        constraint()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 35
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(RightMessageCell.self, forCellReuseIdentifier: "rcell")
        tableView.register(LeftMessageCell.self, forCellReuseIdentifier: "lcell")
        tableView.register(LeftGroupMessageCell.self, forCellReuseIdentifier: "lcell-g")
    }
    
    private func constraint() {
        NSLayoutConstraint.activate([
            // headerView
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 88),
            // bottomView
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 50),
            // tableView
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
        ])
    }
}

extension ChatPageView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: MessageCell
        
        switch chat.messageLocation(forIndex: indexPath.row) {
        case .left:
            cell = prepareLeftCell(tableView, for: indexPath)
        case .right:
            cell = prepareRightCell(tableView, for: indexPath)
        }
        
        cell.maxWidth = view.bounds.width - 85
        cell.configure(with: chat.messages[indexPath.row])
        cell.marginBottom = chat.authorWillChange(afterIndex: indexPath.row) ? 8 : 5

        if indexPath.row == 0 {
            cell.marginTop = 8
        }
        
        return cell
    }
    
    func prepareLeftCell(_ tableView: UITableView, for indexPath: IndexPath) -> LeftMessageCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lcell-g", for: indexPath) as! LeftGroupMessageCell
        
        if !chat.authorWillChange(afterIndex: indexPath.row) {
            cell.showAvatar = false
        }
        
        return cell
    }
    
    func prepareRightCell(_ tableView: UITableView, for indexPath: IndexPath) -> RightMessageCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rcell", for: indexPath) as! RightMessageCell
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat.messages.count
    }
}
