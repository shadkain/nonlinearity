//
//  Tabs.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 27/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

struct Tab {
    var title: String
}

class Tabs {
    private var tabs: [Tab] = []
    var tabViews: [TabView] = []
    
    init() {
        tabs = setTabs()
        initTabViews()
    }
    
    func getElementsCount() -> Int {
        return tabViews.count
    }
    
    func getTabViewByIndex(index: Int) -> TabView {
        return tabViews[index]
    }
    
    func activateViewByIndex(index: Int) {
        for tabView in tabViews {
            tabView.deactivate()
        }
        
        tabViews[index].activate()
    }
}

extension Tabs {
    private func setTabs() -> [Tab] {
        var newTabs: [Tab] = []
        newTabs.append(contentsOf: [
            .init(title: "Главная"),
            .init(title: "Читать"),
            .init(title: "Слушать"),
            .init(title: "Играть")
        ])
        
        return newTabs
    }
    
    private func initTabViews() {
        for tab in tabs {
            let tabView = TabView(frame: .zero)
            tabView.setTitle(title: tab.title)
            
            tabViews.append(tabView)
        }
    }
}
