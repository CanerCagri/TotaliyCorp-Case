//
//  FirstContainerView.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 1.08.2023.
//

import UIKit

class FirstContainerFirstView: UIView {
    
     var mainView: UILabel = {
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
        addSubviews(mainView)
        
        mainView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -120).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
