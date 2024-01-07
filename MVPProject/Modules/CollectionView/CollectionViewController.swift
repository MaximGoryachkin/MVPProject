//
//  ViewController.swift
//  MVPProject
//
//  Created by Максим Горячкин on 23.12.2023.
//

import UIKit
import SwiftUI

protocol CollectionViewProtocol: AnyObject {
    func render(_ model: CollectionViewModel)
    func presentDetailView(_ model: DetailViewModel)
}

final class CollectionViewController: UIViewController {
    
    let collectionView: UICollectionView = .createCollectionView(with: .mainLayout)
    private lazy var dataSource = CollectionDataSource(collectionView)
    
    override func loadView() {
        super.loadView()
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

extension CollectionViewController: CollectionViewProtocol {
    func render(_ model: CollectionViewModel) {
        dataSource.update(with: model.pictures)
    }
    
    func presentDetailView(_ model: DetailViewModel) {
        
    }
}

struct ListProvider: PreviewProvider {
    static var previews: some View {
        ConteinerView().ignoresSafeArea()
    }
    
    struct ConteinerView: UIViewControllerRepresentable {
        let homeVC = CollectionViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            homeVC
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
