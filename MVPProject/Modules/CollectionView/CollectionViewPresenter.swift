//
//  CollectionViewPresenter.swift
//  MVPProject
//
//  Created by Максим Горячкин on 23.12.2023.
//

import Foundation

protocol CollectionPresenterProtocol {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidDisappear()
    func didSelectItem(at index: Int)
}

final class CollectionViewPresenter {
    
}
