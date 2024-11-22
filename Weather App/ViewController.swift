//
//  ViewController.swift
//  Weather App
//
//  Created by Davi Paiva on 21/11/24.
//

import UIKit

class ViewController: UIViewController {
  
    // MARK: - Global Variables
    private lazy var backGroundView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Aquiraz"
        label.textAlignment = .center
        label.textColor = UIColor(named: "primaryColor")
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 50,weight: .bold)
        label.text = "25°C"
        label.textAlignment = .left
        label.textColor = UIColor(named: "primaryColor")
        return label
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sunIcon")
        
        return imageView
    }()
    
    // MARK: - Cycles
    // setup after loading the view in the first time.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    // setup befor every time the view will appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // setup every time the view appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        	
    }
    
    // setup before window diasappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // setup when window dissapear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    // MARK: - Custom View
    
    private func setupView(){
        // set backgound View
        setHierarchy()
        setContraints()
        
        // set headerView
    }
    
    private func setHierarchy(){
        view.addSubview(backGroundView)
        view.addSubview(headerView)
        
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(weatherIcon)
    }
    
    private func setContraints(){
        // backgound contraints
        backGroundView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        backGroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backGroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backGroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // header contraints
        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 59).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 35).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 169).isActive = true
        
        // city contraints
        cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // temperature contraints
        temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 21).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26).isActive = true
        
        // weather icon contraints
        weatherIcon.widthAnchor.constraint(equalToConstant: 86).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 86).isActive = true
        weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: -26).isActive = true
        weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor).isActive = true
        weatherIcon.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor,constant: 15).isActive = true
        
    }
    
}

