//
//  ChatScreenView+DataSource.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 22.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

extension ChatScreenView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.messagesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: presenter.messageId(at: indexPath.row), for: indexPath) as! ChatBaseMessageCell
        
        cell.maxMessageWidth = bounds.width - spacing.messageWidthOffset
        presenter.showCell(cell, at: indexPath.row)
        
        return cell
    }
}
