//
//  MessageViewStack.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 11.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

extension Message {
    class VStackViewModel {
        func push(message: Message) {
            didPushed?(.init(fromModel: message))
        }
        
        func push(messages: [Message]) {
            messages.forEach { self.push(message: $0) }
        }
        
        var didPushed: ((Message.View) -> Void)?
    }
    
    class BaseSequenceView: UIViewComponent {
        private var viewsToPlace: Queue<Message.View> = .init()
        private var placedViews: [Message.View] = []
        private var maxWidth: CGFloat
        
        var viewModel: VStackViewModel! {
            didSet {
                viewModel.didPushed = { [unowned self] view in
                    self.viewsToPlace.push(view)
                    self.addSubview(view)
                }
            }
        }
        
        init(withMaxMessageWidth maxWidth: CGFloat) {
            self.maxWidth = maxWidth
            super.init(frame: .zero)
        }
        
        func layout() {
            if placedViews.isEmpty {
                guard let firstView = viewsToPlace.pop() else { return }
                initLayout(withView: firstView, maxWidth: maxWidth)
                placedViews.append(firstView)
            }
            
            viewsToPlace.forEachPop {
                extendLayout(put: $0, under: placedViews.last!, maxWidth: maxWidth)
                placedViews.append($0)
            }
            
            didLayout(on: placedViews.last!)
        }
        
        func layout(withMaxWidth maxWidth: CGFloat) {
            self.maxWidth = maxWidth
            
            let newQueue = Queue<Message.View>()
            placedViews.forEach { newQueue.push($0) }
            viewsToPlace.forEachPop { newQueue.push($0) }
            viewsToPlace = newQueue
            
            layout()
        }
        
        func initLayout(withView view: Message.View, maxWidth: CGFloat) {
            fatalError("initLayout(withView:) has not been implemented")
        }
        
        func extendLayout(put newView: Message.View, under lastView: Message.View, maxWidth: CGFloat) {
            fatalError("attachToBottom() has not been implemented")
        }
        
        func didLayout(on lastView: Message.View) {
            fatalError("attachToBottom() has not been implemented")
        }
    }
}
