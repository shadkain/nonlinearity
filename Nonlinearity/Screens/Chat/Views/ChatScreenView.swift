//
//  ScreenView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 04.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class ChatScreenView: UIScreenView {
    let headerView = ChatHeaderView()
    let footerView = ChatFooterView()
    let tableView = UITableView()
    
    var presenter: ChatScreenPresenterProtocol!
    
    override func setup() {
        self.backgroundColor = .hex(rgb: 0x191919)
        
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = size.rowHeight
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ChatRightMessageCell.self, forCellReuseIdentifier: rightMessageId)
        tableView.register(ChatLeftUnauthoredMessageCell.self, forCellReuseIdentifier: leftUnauthoredMessageId)
        tableView.register(ChatLeftAuthoredMessageCell.self, forCellReuseIdentifier: leftAuthoredMessageId)
        
        ChatBaseMessageCell.marginPatterns[.first] = (top: spacing.messageBigV, bottom: spacing.messageSmallV)
        ChatBaseMessageCell.marginPatterns[.regular] = (top: 0, bottom: spacing.messageSmallV)
        ChatBaseMessageCell.marginPatterns[.lastInChain] = (top: 0, bottom: spacing.messageBigV)
        
        [headerView, footerView, tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        let headerBottomConst: CGFloat = (window?.safeAreaInsets.top ?? 1 > 0) ? 44 : 72
        
        NSLayoutConstraint.activate([
            // headerView
            headerView.leftAnchor.constraint(equalTo: leftAnchor),
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.rightAnchor.constraint(equalTo: rightAnchor),
            headerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: headerBottomConst),
            // bottomView
            footerView.leftAnchor.constraint(equalTo: leftAnchor),
            footerView.rightAnchor.constraint(equalTo: rightAnchor),
            footerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 70),
            // tableView
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: footerView.topAnchor),
        ])
    }
}
