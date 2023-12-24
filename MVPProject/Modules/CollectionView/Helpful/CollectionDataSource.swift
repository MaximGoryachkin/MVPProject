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
            case .cell(let model):
                let cell = cell as? CollectionCell
                //                cell?.configure(with: category)
                
                return cell
            }
        }
        
        registerCells()
        collectionView.dataSource = dataSource
    }
    
    //MARK: - Public methods
//    func update(categoryModels: [CategoryViewModel], topBooks: [Book] = [], recentBooks: [Book] = []) {
//        var snapshot = DataSnapshot()
//        let sections = BookSection.allCases
//        snapshot.appendSections(sections)
//        snapshot.appendItems(
//            categoryModels.map(Item.categories),
//            toSection: .categories
//        )
//        snapshot.appendItems(
//            topBooks.map(Item.top),
//            toSection: .top
//        )
//        snapshot.appendItems(
//            recentBooks.map(Item.recent),
//            toSection: .recent
//        )
//        
//        snapshot.reloadSections(sections)
//        dataSource.apply(snapshot)
//    }
    
//    func updateHeader(with model: HomeViewModel) {
//        dataSource.supplementaryViewProvider = nil
//        
//        let supplementary: DataSource.SupplementaryViewProvider = { collectionView, kind, indexPath in
//            let header = collectionView.dequeueReusableSupplementaryView(
//                ofKind: kind,
//                withReuseIdentifier: SectionHeaderView.identifier,
//                for: indexPath
//            ) as? SectionHeaderView
//            
//            switch BookSection(rawValue: indexPath.section) {
//            case .categories:
//                header?.configure(with: model.topBooksHeader.title,
//                                  buttonTitle: model.topBooksHeader.button.title,
//                                  tapAction: model.topBooksHeader.button.action)
//            case .top:
//                header?.configure(with: "", buttonTitle: "", tapAction: {})
//            case .recent:
//                header?.configure(with: model.recentBooksHeader.title,
//                                  buttonTitle: model.recentBooksHeader.button.title,
//                                  tapAction: model.recentBooksHeader.button.action)
//            default:
//                assertionFailure("Unknown header type!")
//            }
//            
//            return header
//        }
//        
//        dataSource.supplementaryViewProvider = supplementary
//        
//    }
//    
}

private extension CollectionDataSource {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias DataSnapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    func registerCells() {
        collectionView.register(
            CollectionCell.self,
            forCellWithReuseIdentifier: CollectionCell.identifier
        )
    }
 
    enum Section {
        case main
    }
    
    enum Item: Hashable {
        case cell(CollectionViewModel)
        
        var identifier: String {
            switch self {
            case .cell: return CollectionCell.identifier
            }
        }
    }
}
