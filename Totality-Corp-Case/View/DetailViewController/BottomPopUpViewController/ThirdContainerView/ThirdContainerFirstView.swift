//
//  ThirdContainerFirstView.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 2.08.2023.
//

import UIKit

class ThirdContainerFirstView: UIView {
    
    // MARK: - UI Components
    var mainLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ready To Play?"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    var secondaryLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "OSWALD"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    var thirdLabel: UILabel = {
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
        addSubviews(mainLabel, secondaryLabel, thirdLabel)
        
        mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        
        secondaryLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        secondaryLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 5).isActive = true
        
        thirdLabel.topAnchor.constraint(equalTo: secondaryLabel.bottomAnchor, constant: 5).isActive = true
        thirdLabel.leadingAnchor.constraint(equalTo: secondaryLabel.leadingAnchor, constant: -10).isActive = true
        thirdLabel.trailingAnchor.constraint(equalTo: secondaryLabel.trailingAnchor, constant: 10).isActive = true
        thirdLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
}
