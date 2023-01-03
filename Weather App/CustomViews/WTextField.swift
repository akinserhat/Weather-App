//
//  WTextField.swift
//  Weather App
//
//  Created by Akın Serhat Göksel on 3.01.2023.
//

import UIKit

class WTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        minimumFontSize = 12
        placeholder = "Enter a city name."
        layer.cornerRadius = 12
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        textColor = .label
        tintColor = .label
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        backgroundColor = .systemCyan
        autocorrectionType = .no
    }
    
}
