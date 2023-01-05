//
//  WeatherVC.swift
//  Weather App
//
//  Created by Akın Serhat Göksel on 3.01.2023.
//

import UIKit

class WeatherVC: UIViewController {
    
    let weatherLogoImageView = UIImageView()
    let weatherTextField = WTextField()
    let getTheWeatherButton = WButton(title: "Get Weather Info", backgroundColor: .systemCyan)
    
    var isCityNameEntered: Bool { return !weatherTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        assignBackground()
        createDismissKeyboard()
        configureWeatherLogoImageView()
        configureWeatherTextField()
        configureGetTheWeatherButton()
        
    }
    
    func createDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tapGesture)
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
    
    
    
    func configureWeatherLogoImageView() {
        view.addSubview(weatherLogoImageView)
        weatherLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherLogoImageView.image = UIImage(named: "logo")!
        
        NSLayoutConstraint.activate([
            weatherLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            weatherLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherLogoImageView.heightAnchor.constraint(equalToConstant: 200),
            weatherLogoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureWeatherTextField() {
        view.addSubview(weatherTextField)
        weatherTextField.delegate = self
        
        NSLayoutConstraint.activate([
            weatherTextField.topAnchor.constraint(equalTo: weatherLogoImageView.bottomAnchor, constant: 48),
            weatherTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            weatherTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            weatherTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureGetTheWeatherButton() {
        view.addSubview(getTheWeatherButton)
        getTheWeatherButton.addTarget(self, action: #selector(pushWeatherDetailVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            getTheWeatherButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            getTheWeatherButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            getTheWeatherButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            getTheWeatherButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func pushWeatherDetailVC() {
        
        guard isCityNameEntered else {
            let alert = UIAlertController(title: "Empty City Name", message: "Please enter a city name.", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okBtn)
            self.present(alert, animated: true)
            return
        }
        let weatherDetailVC = WeatherDetailVC()
        weatherDetailVC.cityName = weatherTextField.text
        weatherDetailVC.title = weatherTextField.text
        navigationController?.pushViewController(weatherDetailVC, animated: true)
    }
}


extension WeatherVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushWeatherDetailVC()
        return true
    }
}
