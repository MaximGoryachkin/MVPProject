//
//  DetailViewController.swift
//  MVPProject
//
//  Created by Максим Горячкин on 23.12.2023.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    func render(_ model: DetailViewModel)
}

final class DetailViewController: UIViewController {
    
    let presenter: DetailViewPresenterProtocol
    
    init(presenter: DetailViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = DetailView(frame: self.view.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        view.layoutIfNeeded()
    }
}

extension DetailViewController: DetailViewProtocol {
    func render(_ model: DetailViewModel) {
        let view = view as! DetailView
        view.renderViews(with: model)
    }
}
