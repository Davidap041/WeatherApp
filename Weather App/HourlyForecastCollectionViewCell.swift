//
//  HourlyForecastCollectionViewCell.swift
//  Weather App
//
//  Created by Davi Paiva on 22/11/24.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    static let identifier :String = "HourlyForescast"
    
    private lazy var hourLabel :UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12:00"
        label.textColor = .contrastColor
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return label
    }()
    private lazy var imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sunIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25ºC"
        label.textAlignment = .center
        label.textColor = .contrastColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourLabel,imageIcon,temperatureLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        stackView.isLayoutMarginsRelativeArrangement = true        
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.contrastColor?.cgColor
        stackView.layer.cornerRadius = 20
        
        return stackView
    }()
    
    // MARK: - Cycles
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupView()
    }
    // not initialized only with stortboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    private func setHierarchy() {
        contentView.addSubview(stackView)
        
    }
    private func setConstraints(){
        stackView.setConstraintsToParent(contentView)        
        imageIcon.heightAnchor.constraint(equalToConstant: 33).isActive = true
    }
    
    
}
