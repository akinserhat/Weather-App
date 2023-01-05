//
//  WeatherDetailVC.swift
//  Weather App
//
//  Created by Akın Serhat Göksel on 3.01.2023.
//

import UIKit

class WeatherDetailVC: UIViewController {
    
    var cityName: String!
    var weathers: WeatherData!
    
    var windSpeedLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        getCityWeatherData()
        configureLabel()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func getCityWeatherData() {
        NetworkManager.shared.fetchCityData(for: cityName) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weathers):
                    self.weathers = weathers
                    self.windSpeedLabel.text = String(weathers.wind.speed)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
           
        }
    }
    
    func configureLabel() {
        view.addSubview(windSpeedLabel)
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        windSpeedLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        windSpeedLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            windSpeedLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            windSpeedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            windSpeedLabel.heightAnchor.constraint(equalToConstant: 100),
            windSpeedLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

}
