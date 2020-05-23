//
//  ScreenView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 04.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

enum ChatMessageCellVLocation {
    case first, regular, last
}

protocol ChatScreenViewProtocol: class {
    
}

final class ChatScreenView: UIViewComponent, ChatScreenViewProtocol {
    let headerView = ChatHeaderView()
    let bottomView = ChatBottomView()
    let tableView = UITableView()
    
    var presenter: ChatScreenPresenterProtocol!
    
    override func setup() {
        self.backgroundColor = .hex(rgb: 0x191919)
        
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 35
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ChatRightMessageCell.self, forCellReuseIdentifier: cellId.right)
        tableView.register(ChatLeftUnauthoredMessageCell.self, forCellReuseIdentifier: cellId.leftUnauthored)
        tableView.register(ChatLeftAuthoredMessageCell.self, forCellReuseIdentifier: cellId.leftAuthored)
        
        ChatBaseMessageCell.marginPatterns[.first] = (top: 8, bottom: 5)
        ChatBaseMessageCell.marginPatterns[.regular] = (top: 0, bottom: 5)
        ChatBaseMessageCell.marginPatterns[.last] = (top: 0, bottom: 8)
        
        [headerView, bottomView, tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            // headerView
            headerView.leftAnchor.constraint(equalTo: leftAnchor),
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.rightAnchor.constraint(equalTo: rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 88),
            // bottomView
            bottomView.leftAnchor.constraint(equalTo: leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: rightAnchor),
            bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 50),
            // tableView
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
        ])
    }
}
