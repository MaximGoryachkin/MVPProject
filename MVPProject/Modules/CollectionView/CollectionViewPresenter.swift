//
//  CollectionViewPresenter.swift
//  MVPProject
//
//  Created by Максим Горячкин on 23.12.2023.
//

import UIKit

protocol CollectionPresenterProtocol {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidDisappear()
    func didSelectItem(at index: Int)
}

final class CollectionViewPresenter: CollectionPresenterProtocol {
    weak var view: CollectionViewController?
    private let networking = NetworkManager.shared
    private var pictures: [PictureModel] = []
    
    func viewDidLoad() {
        fetchData()
    }
    
    func viewWillAppear() {
        
    }
    
    func viewDidDisappear() {
        
    }
    
    func didSelectItem(at index: Int) {
        view?.presentDetailView(pictures[index])
    }
    
    private func fetchData() {
        Task.detached { [unowned self] in
            do {
                async let model: [APIModel] = try networking.fetchAsyncData(from: .home())
                let pictures: [PictureModel] = try await model.map(toPicture(_:))
                self.pictures = pictures
                print(pictures)
                await MainActor.run {
                    self.view?.render(
                        .init(pictures: self.pictures)
                    )
                }
            } catch {
                await MainActor.run {
                    self.view?.showError(error.localizedDescription)
                }
            }
        }
    }
    
    private func toPicture(_ model: APIModel) -> PictureModel {
        .init(name: model.title,
              date: model.date,
              url: model.url,
              description: model.explanation
        )
    }
}
