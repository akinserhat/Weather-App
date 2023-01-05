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

    
    let windSpeedLabel = WLabel(textAlignment: .center, fontSize: 24)
    let tempLabel = WLabel(textAlignment: .center, fontSize: 24)
    let humidityLabel = WLabel(textAlignment: .center, fontSize: 24)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        assignBackground()
        configureNav()
        getCityWeatherData()
        configureTempLabel()
        configureWindSpeedLabel()
        configureHumidityLabel()
    }
    
    func getCityWeatherData() {
        NetworkManager.shared.fetchCityData(for: cityName) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weathers):
                    self.weathers = weathers
                    self.windSpeedLabel.text = "💨 \(weathers.wind.speed)"
                    self.humidityLabel.text = "💧 \(weathers.main.humidity)"
                    self.tempLabel.text = "🌤 \(weathers.main.temp) °C"
                    
                case .failure(let error):
                    let alert = UIAlertController(title: "Something went wrong.", message: error.rawValue, preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(okBtn)
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    func assignBackground(){
        let background = UIImage(named: "background")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        }
    
    func configureNav() {
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationItem.standardAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
    }
    
    
    
    func configureTempLabel() {
        view.addSubview(tempLabel)
        
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tempLabel.heightAnchor.constraint(equalToConstant: 75),
            tempLabel.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    func configureWindSpeedLabel() {
        view.addSubview(windSpeedLabel)
        
        NSLayoutConstraint.activate([
            windSpeedLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 50),
            windSpeedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            windSpeedLabel.heightAnchor.constraint(equalToConstant: 75),
            windSpeedLabel.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    func configureHumidityLabel() {
        view.addSubview(humidityLabel)
        
        NSLayoutConstraint.activate([
            humidityLabel.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: 50),
            humidityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            humidityLabel.heightAnchor.constraint(equalToConstant: 75),
            humidityLabel.widthAnchor.constraint(equalToConstant: 75)
        ])
    }

}
