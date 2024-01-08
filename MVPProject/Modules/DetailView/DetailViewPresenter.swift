//
//  DetailViewPresenter.swift
//  MVPProject
//
//  Created by Максим Горячкин on 23.12.2023.
//

import Foundation

protocol DetailViewPresenterProtocol {
    func viewDidLoad()
}

final class DetailViewPresenter: DetailViewPresenterProtocol {
    let pictureModel: PictureModel
    weak var view: DetailViewProtocol?
    private var detailModel: DetailViewModel {
        .init(image: pictureModel.url,
              title: pictureModel.name,
              date: pictureModel.date,
              descripption: pictureModel.description)
    }
    
    init(pictureModel: PictureModel) {
        self.pictureModel = pictureModel
    }
    
    func viewDidLoad() {
        view?.render(detailModel)
    }
    
}
