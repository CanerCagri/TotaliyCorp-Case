//
//  TCCircleLabel.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 2.08.2023.
//

import UIKit

class TCCircleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, cornerRadius: CGFloat) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
    }
}
