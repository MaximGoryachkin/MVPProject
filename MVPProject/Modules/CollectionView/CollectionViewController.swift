//
//  ViewController.swift
//  MVPProject
//
//  Created by Максим Горячкин on 23.12.2023.
//

import UIKit

protocol CollectionViewProtocol {
    func render(_ model: CollectionViewModel)
    func presentDetailView(_ model: DetailViewModel)
}

final class CollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

