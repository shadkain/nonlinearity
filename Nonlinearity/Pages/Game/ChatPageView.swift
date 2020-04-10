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
    let headerView = UIView()
    var messageView: MessageView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .hex(rgb: 0x191919)

        headerView.backgroundColor = .hex(rgb: 0x252525)
        
        messageView = .init(fromModel: .init(
            sender: .companion,
            message: "Hello, dude! I really miss you. Hope we'll meet soon! Looking forward to it!",
            time: .init(hours: 22, minutes: 56)
            ), withMaxWidth: 290)
        
        [headerView, messageView].forEach { view.addSubview($0) }
    }

    override func viewWillLayoutSubviews() {
        headerView.pin
            .top()
            .horizontally()
            .height(88)
        
        messageView.pin
            .left(8)
            .below(of: headerView)
            .marginTop(8)
    }
}
