//
//  CollectionDelegate.swift
//  MVPProject
//
//  Created by Максим Горячкин on 08.01.2024.
//

import UIKit

final class BooksCollectionDelegate: NSObject, UICollectionViewDelegate {
    private let collectionView: UICollectionView
    
    var didSelectItemAt: ((Int) -> Void)?
    
    init(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch Section(rawValue: indexPath.section) {
        case .main:
            didSelectItemAt?(indexPath.item)
        case .none:
            print("error")
            return
        }
    }
}

