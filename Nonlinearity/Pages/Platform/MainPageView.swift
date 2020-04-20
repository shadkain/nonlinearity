//
//  MainPageView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 19/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation
import UIKit

class MainPageView: UIViewController {
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hex(rgb: 0x252525)
        
        view.addSubview(stackView)
        
        let bubble = BubbleViewCollection()
        let tableCard = TableCardView()
    
        add(tableCard)
        add(bubble)
        
        bubble.collectionView!.delegate = self
        tableCard.tableView!.delegate = self
        for cell in tableCard.tableView!.visibleCells {
            let tableCardCell = cell as! TableCardViewCell
            tableCardCell.collectionView!.delegate = self
        }
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension MainPageView {
    func add(_ child: UIViewController) {
        stackView.addArrangedSubview(child.view)
        addChild(child)
        child.didMove(toParent: parent)
    }

    func remove(_ child: UIViewController) {
        guard child.parent != nil else {
            return
        }

        child.willMove(toParent: nil)
        stackView.removeArrangedSubview(child.view)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}

extension MainPageView: UICollectionViewDelegate {

   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      print("User tapped on item \(indexPath.item)")
   }
}

extension MainPageView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}
