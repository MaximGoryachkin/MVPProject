//
//  UICollectionView + ext.swift
//  MVPProject
//
//  Created by Максим Горячкин on 07.01.2024.
//

import UIKit.UICollectionView

extension UICollectionView {
    static func createCollectionView(with layout: UICollectionViewLayout) -> UICollectionView {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .red
        view.showsVerticalScrollIndicator = false
        return view
    }
}
