//
//  OpenLibraryEndpoints.swift
//  MVPProject
//
//  Created by Максим Горячкин on 24.12.2023.
//

import Foundation

struct OpenLibraryEndpoints {
    private let host: String
    private let path: String
    private let queryItems: [URLQueryItem]
    private var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        
        guard let url = components.url else {
            preconditionFailure("Unable to create url from: \(components)")
        }
        
        return url
    }
    
    private init(host: String = "api.nasa.gov",
                 path: String = "/planetary/apod",
                 queryItems: [URLQueryItem]) {
        self.host = host
        self.path = path
        self.queryItems = queryItems
    }
    
    func request(_ payload: Data? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpBody = payload
        return request
    }
    
    static func home(limit: Int = 30) -> Self {
        .init(queryItems: [
            .init(name: "api_key", value: "7TXq0HA9eS3awwPE45A8Ed3UPNz4ERkBGkB0O76z"),
            .init(name: "count", value: limit.description),
            .init(name: "thumbs", value: "true")
        ])
    }
    
}
