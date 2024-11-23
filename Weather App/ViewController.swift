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
        view.backgroundColor = .constrastColor
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
        label.textColor = .primaryColor
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 50,weight: .bold)
        label.text = "25°C"
        label.textAlignment = .left
        label.textColor = .primaryColor
        return label
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sunIcon")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Umidade"
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.textColor = .constrastColor
        
        return label
    }()

    private lazy var humidityValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "100mm"
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.textColor = .constrastColor
        
        return label
    }()
    
    private lazy var humidityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityLabel,humidityValueLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        
        
        return stackView
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vento"
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.textColor = .constrastColor
        
        return label
    }()

    private lazy var windValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10Km/h"
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.textColor = .constrastColor
        
        return label
    }()
    
    private lazy var windStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [windLabel,windValueLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        
        
        return stackView
    }()
    
    private lazy var stackStacks: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityStackView,windStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.backgroundColor = .softGrayColor
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        
        return stackView
    }()
    
    private lazy var hourlyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Previsão por Hora"
        label.textColor = .constrastColor
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var hourlyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 67, height: 84)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
              
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        
        collectionView.register(HourlyForecastCollectionViewCell.self, forCellWithReuseIdentifier: HourlyForecastCollectionViewCell.identifier)
        
        return collectionView
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
        view.addSubview(stackStacks)
        view.addSubview(hourlyForecastLabel)
        view.addSubview(hourlyCollectionView)
        
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
        
        // stack stacks View
        stackStacks.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24).isActive = true
        stackStacks.widthAnchor.constraint(equalToConstant: 206).isActive = true
        stackStacks.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        
        // hourlyForecast Label contraints
        hourlyForecastLabel.topAnchor.constraint(equalTo: stackStacks.bottomAnchor,constant: 29).isActive = true
        hourlyForecastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        hourlyForecastLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        
        // hourlyCollection contraints
        hourlyCollectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor, constant: 22).isActive = true
        hourlyCollectionView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        hourlyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hourlyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
}

extension ViewController :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    
}
