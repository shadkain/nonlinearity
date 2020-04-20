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
    private let companionLabel = UILabel()
    private let onlineLabel = UILabel()
    private let backArrowView = UIImageView()
    private var chat: Chat!
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hex(rgb: 0x191919)
        
        setupHeaderView()
        setupTableView()
        configure(with: .init())
        
        [headerView, tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        constraint()
    }
    
    private func setupHeaderView() {
        headerView.backgroundColor = .hex(rgb: 0x252525)
        
        companionLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        companionLabel.textAlignment = .center
        companionLabel.textColor = .hex(rgb: 0xE1E3E6)
        
        onlineLabel.font = .systemFont(ofSize: 13, weight: .regular)
        onlineLabel.textAlignment = .center
        onlineLabel.textColor = .hex(rgb: 0xAEAEAE)
        
        backArrowView.image = .init(imageLiteralResourceName: "back-arrow")
        
        [companionLabel, backArrowView, onlineLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview($0)
        }
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
    }
    
    private func constraint() {
        NSLayoutConstraint.activate([
            // headerView
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 88),
            // tableView
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            backArrowView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 12),
            backArrowView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -12),
            onlineLabel.centerXAnchor.constraint(equalTo: companionLabel.centerXAnchor),
            onlineLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -6),
            companionLabel.bottomAnchor.constraint(equalTo: onlineLabel.topAnchor, constant: -1),
            companionLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
        ])
    }
    
    func configure(with chat: Chat) {
        self.chat = chat
        
        if !chat.isGroup {
            companionLabel.text = chat.companions[0].nameString()
        }
        
        onlineLabel.text = "в сети"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "lcell", for: indexPath) as! LeftMessageCell
        
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
