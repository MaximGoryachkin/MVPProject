//
//  APIModel.swift
//  MVPProject
//
//  Created by Максим Горячкин on 24.12.2023.
//

import Foundation

struct APIModel: Decodable {
    let copyright: String?
    let date: String
    let explanation: String
    let hdurl: String?
    let title: String
    let url: String
}
