//
//  CollectionCell.swift
//  MVPProject
//
//  Created by Максим Горячкин on 24.12.2023.
//

import UIKit.UICollectionViewCell

class CollectionCell: UICollectionViewCell {
    static let identifier = String(describing: CollectionCell.self)
    
    let label: UILabel = {
        let view = UILabel()
        view.text = "Hello, World!"
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        label.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ category: CollectionViewModel) {
        contentView.backgroundColor = .blue
    }
    
}
