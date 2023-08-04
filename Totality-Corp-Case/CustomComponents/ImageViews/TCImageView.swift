//
//  TCImageView.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 2.08.2023.
//

import UIKit

class TCImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure(cornerRadius: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(cornerRadius: CGFloat, baseBackgroundColor: UIColor? = Colors.imageBackgroundColor) {
        super.init(frame: .zero)
        configure(cornerRadius: cornerRadius, baseBackgroundColor: baseBackgroundColor)
    }
    
    private func configure(cornerRadius: CGFloat, baseBackgroundColor: UIColor? = Colors.imageBackgroundColor) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = baseBackgroundColor
        layer.cornerRadius = cornerRadius

    }
}
