//
//  SecondContainer.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 2.08.2023.
//

import UIKit

class FirstContainerSecondView: UIView {
    
    let firstCircleView = TCCircleLabel(backgroundColor: .systemGray3, cornerRadius: 35)
    let secondCircleView = TCCircleLabel(backgroundColor: .systemGray3, cornerRadius: 35)

    var firstNameView: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var secondNameView: UILabel = {
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
        addSubviews(firstCircleView, secondCircleView, firstNameView, secondNameView)
        
        firstCircleView.topAnchor.constraint(equalTo: self.topAnchor, constant: -50).isActive = true
        firstCircleView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        firstCircleView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        firstCircleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        
        secondCircleView.topAnchor.constraint(equalTo: self.topAnchor, constant: -50).isActive = true
        secondCircleView.leadingAnchor.constraint(equalTo: firstCircleView.trailingAnchor, constant: 90).isActive = true
        secondCircleView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        secondCircleView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        
        firstNameView.centerXAnchor.constraint(equalTo: firstCircleView.centerXAnchor).isActive = true
        firstNameView.topAnchor.constraint(equalTo: firstCircleView.bottomAnchor, constant: 20).isActive = true
        firstNameView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        firstNameView.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        secondNameView.centerXAnchor.constraint(equalTo: secondCircleView.centerXAnchor).isActive = true
        secondNameView.topAnchor.constraint(equalTo: secondCircleView.bottomAnchor, constant: 20).isActive = true
        secondNameView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        secondNameView.heightAnchor.constraint(equalToConstant: 33).isActive = true
    }
}
