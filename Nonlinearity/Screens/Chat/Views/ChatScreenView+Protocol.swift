//
//  ChatScreenView+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatScreenViewProtocol: class {
    var presenter: ChatScreenPresenterProtocol! { get set }
    
    var headerViewProtocol: ChatHeaderViewProtocol { get }
    var footerViewProtocol: ChatFooterViewProtocol { get }
    
    var isScrolledToBottom: Bool { get }
    
    func reload()
    func scrollToBottom()
}

extension ChatScreenView: ChatScreenViewProtocol {
    var headerViewProtocol: ChatHeaderViewProtocol { headerView }
    var footerViewProtocol: ChatFooterViewProtocol { footerView }
    
    var isScrolledToBottom: Bool {
           ((tableView.contentSize.height - tableView.frame.height) - tableView.contentOffset.y) < tableView.estimatedRowHeight
    }
       
   func reload() {
       tableView.reloadData()
       scrollToBottom()
   }
   
   func scrollToBottom() {
       let indexPath = IndexPath(row: presenter.messagesCount-1, section: 0)
       tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
   }
}
