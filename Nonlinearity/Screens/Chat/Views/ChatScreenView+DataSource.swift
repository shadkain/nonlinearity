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
        let id = getCellId(forType: presenter.messageType(forIndex: indexPath.row))
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! ChatBaseMessageCell
        
        cell.maxMessageWidth = 290
        presenter.cellWillBeInserted(cell, forIndex: indexPath.row)
        
        return cell
    }
    
    func getCellId(forType type: ChatMessageType) -> String {
        switch type {
        case .right:
            return cellId.right
        case .leftUnauthored:
            return cellId.leftUnauthored
        case .leftAuthored:
            return cellId.leftAuthored
        }
    }
}
