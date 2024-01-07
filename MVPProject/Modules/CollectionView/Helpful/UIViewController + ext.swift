//
//  UIViewController + ext.swift
//  MVPProject
//
//  Created by Максим Горячкин on 07.01.2024.
//

import UIKit.UIViewController

extension UIViewController {
    static var collectionBuilder: UIViewController {
        let presenter = CollectionViewPresenter()
        let collectioViewController = CollectionViewController(
            presenter: presenter
        )
        presenter.view = collectioViewController
        return collectioViewController
    }
}
