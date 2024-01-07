//
//  CollectionViewModel.swift
//  MVPProject
//
//  Created by Максим Горячкин on 23.12.2023.
//

import Foundation

struct CollectionViewModel {
    let topBooksHeader: Header
    let pictures: [PictureModel]
    
    struct Header {
        let title: String
        let button: Button
    }
    
    struct Button {
        let title: String
        let action: () -> Void
    }
}
