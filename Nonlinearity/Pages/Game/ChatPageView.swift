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
    var msg = Message.NamedView()
    
    var messages = ["Hello", "Pop", "Lol"]
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hex(rgb: 0x191919)
        
        setupHeaderView()
        setupTableView()
        
        msg.configure(with: .init(
            author: .init(name: "Аня", surname: "Самсонова"),
            text: "Me",
            time: .init(hours: 22, minutes: 18)
            ), location: .right)
        msg.maxWidth = 290
        
        [headerView, tableView, msg].forEach { view.addSubview($0) }
    }
    
    private func setupHeaderView() {
        headerView.backgroundColor = .hex(rgb: 0x252525)
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .none
//        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MessageCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLayoutSubviews() {
        print("view did layout")
        headerView.pin
            .top()
            .horizontally()
            .height(88)
        
        msg.pin
            .right(8)
            .below(of: headerView)
            .marginTop(8)
        
//        tableView.pin
//            .horizontally()
//            .below(of: headerView)
//            .bottom(400)
    }
}

extension ChatPageView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row]
        
        return cell
    }
}

extension ChatPageView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
