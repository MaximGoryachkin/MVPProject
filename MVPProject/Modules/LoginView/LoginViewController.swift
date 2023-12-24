//
//  LoginViewController.swift
//  MVPProject
//
//  Created by Максим Горячкин on 23.12.2023.
//

import UIKit

protocol LoginViewProtocol {
    func render(_ model: LoginViewModel)
    func presentMainView(_ model: CollectionViewModel)
    func presentAlert()
}

final class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(OpenLibraryEndpoints.home().request())
    }
}
