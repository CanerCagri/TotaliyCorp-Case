//
//  SecondContainerSecondView.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 2.08.2023.
//

import UIKit

class SecondContainerSecondView: UIView {
    
    // MARK: - UI Components
    let firstCircleView: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 30
        label.textAlignment = .center
        label.textColor = .white
        label.text = "5"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.clipsToBounds = true
        return label
    }()
    
    let secondCircleView: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 30
        label.textAlignment = .center
        label.textColor = .white
        label.text = "10"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.clipsToBounds = true
        return label
    }()
    
    let thirdCircleView: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 30
        label.textAlignment = .center
        label.textColor = .white
        label.text = "15"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.clipsToBounds = true
        return label
    }()
    
    let balanceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wallet Balance: 99.999"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    let secondBalanceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        translatesAutoresizingMaskIntoConstraints = false
        isHidden = true
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure UI
    func configure() {
        addSubviews(firstCircleView, secondCircleView, thirdCircleView, balanceLabel, secondBalanceLabel)
        
        firstCircleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        firstCircleView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        firstCircleView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        secondCircleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        secondCircleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        secondCircleView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        secondCircleView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        thirdCircleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        thirdCircleView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        thirdCircleView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        firstCircleView.trailingAnchor.constraint(equalTo: secondCircleView.leadingAnchor, constant: -30).isActive = true
        thirdCircleView.leadingAnchor.constraint(equalTo: secondCircleView.trailingAnchor, constant: 30).isActive = true
        
        balanceLabel.centerXAnchor.constraint(equalTo: firstCircleView.centerXAnchor).isActive = true
        balanceLabel.topAnchor.constraint(equalTo: firstCircleView.bottomAnchor, constant: 20).isActive = true
        balanceLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        balanceLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        secondBalanceLabel.centerXAnchor.constraint(equalTo: thirdCircleView.centerXAnchor).isActive = true
        secondBalanceLabel.topAnchor.constraint(equalTo: balanceLabel.topAnchor, constant: 15).isActive = true
        secondBalanceLabel.bottomAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: -15).isActive = true
        secondBalanceLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
