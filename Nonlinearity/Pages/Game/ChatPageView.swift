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
    var msgVstack: Message.RSequnceView!
    var msgVstack2: Message.LSequenceView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .hex(rgb: 0x191919)

        headerView.backgroundColor = .hex(rgb: 0x252525)
        
        msgVstack = .init(withMaxMessageWidth: 290)
        msgVstack.viewModel = .init()
        msgVstack.viewModel.push(messages: [
            .init(sender: .me,
                  message: "Нравилась она мне, да.",
                  time: .init(hours: 22, minutes: 54)),
            .init(sender: .me,
                  message: "А что поцеловать нельзя было ее?",
                  time: .init(hours: 22, minutes: 56)),
        ])
        
        msgVstack2 = .init(withMaxMessageWidth: 290)
        msgVstack2.viewModel = .init()
        msgVstack2.viewModel.push(messages: [
            .init(sender: .companion,
                  message: "Ммм.. Но я говорила не про нее, а про себя..",
                  time: .init(hours: 22, minutes: 56)),
            .init(sender: .companion,
                  message: "Просто.. Ты сам себе противоречишь",
                  time: .init(hours: 22, minutes: 57)),
        ])
        
        [headerView, msgVstack, msgVstack2].forEach { view.addSubview($0) }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.msgVstack2.viewModel.push(message:
                .init(sender: .companion,
                      message: "Если слово \"люблю\" священно, почему целуешь каждого, кому симпатизируешь?",
                      time: .init(hours: 22, minutes: 57)))
            self.msgVstack2.layout()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            self.msgVstack2.viewModel.push(message:
                .init(sender: .companion,
                      message: "Мне насрать на машу.. Кто ей нравится, с кем она целовалась и тд..",
                      time: .init(hours: 22, minutes: 59)))
            self.msgVstack2.layout()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6, execute: {
            self.msgVstack2.viewModel.push(message:
                .init(sender: .companion,
                      message: "Я про себя говорю",
                      time: .init(hours: 23, minutes: 00)))
            self.msgVstack2.layout()
        })
    }
    
    override func viewDidLayoutSubviews() {
        print("view DID")
        headerView.pin
            .top()
            .horizontally()
            .height(88)
        
        msgVstack.layout()
        msgVstack.pin
            .below(of: headerView, aligned: .right)
            .marginTop(8)
            .marginRight(8)
        
        msgVstack2.layout()
        msgVstack2.pin
            .left(8)
            .below(of: msgVstack)
            .marginTop(8)
    }
}
