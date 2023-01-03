//
//  WButton.swift
//  Weather App
//
//  Created by Akın Serhat Göksel on 3.01.2023.
//

import UIKit

class WButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 12
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
