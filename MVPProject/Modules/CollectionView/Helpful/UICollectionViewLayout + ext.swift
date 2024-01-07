//
//  UICollectionViewLayout + ext.swift
//  MVPProject
//
//  Created by Максим Горячкин on 07.01.2024.
//

import UIKit.UICollectionViewLayout

extension UICollectionViewLayout {
    static let mainLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch Section(rawValue: sectionIndex) {
            case .main:
                return createMainSectionLayout()
            default:
                return nil
            }
        }
        return layout
    }()
    
    private static func createMainSectionLayout() -> NSCollectionLayoutSection {
        let absoluteHeight: CGFloat = 90
        let spacing: CGFloat = 8
        let inset: CGFloat = 12
        
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                          heightDimension: .absolute(absoluteHeight))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
//        let header = createHeader()
//        section.boundarySupplementaryItems = [header]
        return section
    }
    
    private static func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
        let layout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: itemSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        return layout
    }
    
}
