//
//  CollectionCell.swift
//  MVPProject
//
//  Created by Максим Горячкин on 24.12.2023.
//

import UIKit.UICollectionViewCell

class CollectionCell: UICollectionViewCell {
    static let identifier = String(describing: CollectionCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.addSubview(categoryButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
    }
    
}
