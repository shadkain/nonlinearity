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
    let msg = Message.UnnamedView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hex(rgb: 0x191919)
        
        setupHeaderView()
        setupTableView()
        
        msg.configure(with: .init(
            author: .init(name: "Пума", surname: "Тимончик"),
            text: "Иди в попу, ты меня уже задолбал!!! Реально!",
            time: .init(hours: 22, minutes: 20)
            ), location: .right)
        msg.maxWidth = 290
        msg.translatesAutoresizingMaskIntoConstraints = false
        

        
        [headerView, tableView, msg].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            msg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            msg.topAnchor.constraint(equalTo: view.topAnchor, constant: 90)
        ])
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
        
//        tableView.pin
//            .horizontally()
//            .below(of: headerView)
//            .bottom(400)
    }
}

extension ChatPageView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        .init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
