//
//  PictureModel.swift
//  MVPProject
//
//  Created by Максим Горячкин on 07.01.2024.
//

import Foundation

struct PictureModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let date: String
    let url: String
    let description: String
}
