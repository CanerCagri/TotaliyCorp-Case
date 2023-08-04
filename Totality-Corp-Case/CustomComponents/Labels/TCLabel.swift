//
//  TCLabel.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 2.08.2023.
//

import UIKit

class TCLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String, font: UIFont, textAlligment: NSTextAlignment, numberOfLines: Int, lineBreakMode: NSLineBreakMode) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = font
        self.textAlignment = textAlligment
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
    }
    

}
