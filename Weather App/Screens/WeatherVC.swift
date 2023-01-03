//
//  WeatherVC.swift
//  Weather App
//
//  Created by Akın Serhat Göksel on 3.01.2023.
//

import UIKit

class WeatherVC: UIViewController {
    
    let weatherTextField = WTextField()
    let getTheWeatherButton = WButton(title: "GET INFO", backgroundColor: .systemCyan)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}
