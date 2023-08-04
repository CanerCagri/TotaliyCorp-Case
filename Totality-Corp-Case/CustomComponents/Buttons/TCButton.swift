//
//  TCButton.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 2.08.2023.
//

import UIKit

class TCButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure(cornerRadius: 20, baseBackgroundColor: .black)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(cornerRadius: CGFloat, baseBackgroundColor: UIColor) {
        super.init(frame: .zero)
        configure(cornerRadius: cornerRadius, baseBackgroundColor: baseBackgroundColor)
    }
    
    init(backgroundImage: UIImage, alpha: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.setBackgroundImage(backgroundImage, for: .normal)
        self.alpha = alpha
    }
    
    init(setTitle: String, alpha: CGFloat, setTitleColor: UIColor) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(setTitle, for: .normal)
        self.alpha = alpha
        self.setTitleColor(setTitleColor, for: .normal)
    }
    
    private func configure(cornerRadius: CGFloat, baseBackgroundColor: UIColor) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = baseBackgroundColor
        layer.cornerRadius = cornerRadius

    }
}
