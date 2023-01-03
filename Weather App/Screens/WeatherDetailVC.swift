//
//  WeatherDetailVC.swift
//  Weather App
//
//  Created by Akın Serhat Göksel on 3.01.2023.
//

import UIKit

class WeatherDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}
