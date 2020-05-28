//
//  DescriptionView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 27/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class DescriptionView: UIViewComponent {
    
    private var height: CGFloat = 100
    private var font = UIFont.systemFont(ofSize: 17)
    
    var text: String {
        set {
            descriptionLabel.text = newValue
            setConstraint()
        }
        get {
            descriptionLabel.text!
        }
    }
    private let scrollView = UIScrollView()
    private let descriptionLabel = UILabel()
    
    override func setup() {
        
        //scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: height)
        scrollView.isScrollEnabled = true
        addSubview(scrollView)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .hex(rgb: 0xAEAEAE)
        descriptionLabel.font = font
        
        scrollView.addSubview(descriptionLabel)
        
       
    }
    
    override func constraint() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let labelWidth = UIScreen.main.bounds.size.width - 30
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalToConstant: labelWidth)
        ])
    }
    
    private func setConstraint() {
        let labelWidth = UIScreen.main.bounds.size.width - 30
        height = descriptionLabel.text!.boundingRect(usingFont: font,
                                                     maxWidth: labelWidth).height
        if height < 100 {
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 100)
        } else {
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 200)
        }
    }
    
    func getHeight() -> CGFloat {
        return height < 100 ? 100 : 200
    }
}
