//
//  DetailCollectionViewCell.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 1.08.2023.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = K.detailCollectionViewCellIdentifier
    
    let imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .systemGray3
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
