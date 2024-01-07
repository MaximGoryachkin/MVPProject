//
//  CollectionDataSource.swift
//  MVPProject
//
//  Created by Максим Горячкин on 24.12.2023.
//

import UIKit

final class CollectionDataSource {
    private let collectionView: UICollectionView
    private let dataSource: DataSource
    
    init(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        dataSource = .init(collectionView: collectionView) { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: item.identifier,
                for: indexPath
            )
            
            switch item {
            case .main(let model):
                let cell = cell as? CollectionCell
                //                cell?.configure(with: category)
                
                return cell
            }
        }
        
        registerCells()
        collectionView.dataSource = dataSource
    }
    
    // MARK: - Public methods
    func update(with models: [PictureModel]) {
        var snapshot = DataSnapshot()
        let sections = Section.allCases
        snapshot.appendSections(sections)
        snapshot.appendItems(models.map(Item.main), toSection: .main)
        
        snapshot.reloadSections(sections)
        dataSource.apply(snapshot)
    }
    
    func updateHeader(with model: CollectionViewModel) {
        dataSource.supplementaryViewProvider = nil
        
        let supplementary: DataSource.SupplementaryViewProvider = { collectionView, kind, indexPath in
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderView.identifier,
                for: indexPath
            ) as? SectionHeaderView
            
            switch Section(rawValue: indexPath.section) {
            case .main:
                print("Section Header Create")
//                header?.configure(with: model.topBooksHeader.title,
//                                  buttonTitle: model.topBooksHeader.button.title,
//                                  tapAction: model.topBooksHeader.button.action)
            default:
                assertionFailure("Unknown header type!")
            }
            
            return header
        }
        
        dataSource.supplementaryViewProvider = supplementary
        
    }
    
}

private extension CollectionDataSource {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias DataSnapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    func registerCells() {
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.identifier)
    }
    
    enum Item: Hashable {
        case main(PictureModel)
        
        var identifier: String {
            switch self {
            case .main: return CollectionCell.identifier
            }
        }
    }
}
