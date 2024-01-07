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

final class CollectionViewPresenter: CollectionPresenterProtocol {
    weak var view: CollectionViewController?
    
    let pictures = [
        PictureModel(name: "fisrt", date: "01.01.23", url: ""),
        PictureModel(name: "fisrt", date: "01.01.23", url: ""),
        PictureModel(name: "fisrt", date: "01.01.23", url: ""),
        PictureModel(name: "fisrt", date: "01.01.23", url: ""),
        PictureModel(name: "fisrt", date: "01.01.23", url: ""),
        PictureModel(name: "fisrt", date: "01.01.23", url: ""),
        PictureModel(name: "fisrt", date: "01.01.23", url: ""),
        PictureModel(name: "fisrt", date: "01.01.23", url: ""),
        PictureModel(name: "fisrt", date: "01.01.23", url: ""),
        PictureModel(name: "fisrt", date: "01.01.23", url: "")
    ]
    
    func viewDidLoad() {
        view?.render(
            .init(pictures: pictures)
        )
    }
    
    func viewWillAppear() {
        
    }
    
    func viewDidDisappear() {
        
    }
    
    func didSelectItem(at index: Int) {
        
    }
}
