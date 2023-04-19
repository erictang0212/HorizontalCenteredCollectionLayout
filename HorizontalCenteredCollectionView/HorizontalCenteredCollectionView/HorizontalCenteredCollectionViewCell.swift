//
//  HorizontalCenteredCollectionViewCell.swift
//  SwiftLibrary
//
//  Created by ShaoHuan Tang on 2023/4/17.
//

import UIKit

class HorizontalCenteredCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = nil
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(imageView)
        imageView.constraintEqualToSuperView()
    }
    
    func setupColor(_ color: UIColor) {
        imageView.backgroundColor = color
    }
}
