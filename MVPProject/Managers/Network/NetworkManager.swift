//
//  NetworkManager.swift
//  MVPProject
//
//  Created by Максим Горячкин on 24.12.2023.
//

import UIKit

protocol NetworkManagerProtocol {
    func fetchAsyncData<T: Decodable>(from: OpenLibraryEndpoints) async throws -> T
}

final class NetworkManager: NetworkManagerProtocol {
    
    private let decoder: JSONDecoder
    private let cachedImages = NSCache<NSURL, UIImage>()
    private var loadingResponses = [NSURL: [(UIImage?) -> Swift.Void]]()
    
    
    static let shared = NetworkManager()
    
    private init() {
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchAsyncData<T: Decodable>(from endpoint: OpenLibraryEndpoints) async throws -> T {
        try await fetchAsyncData(from: endpoint.request())
    }
    
    private func fetchAsyncData<T: Decodable>(from request: URLRequest) async throws -> T {
        let data: Data
        
//        switch getDataFromCache(from: request) {
//        case .some(let cachedData):
//            data = cachedData
//        case .none:
            let (requestedData, response) = try await URLSession.shared.data(for: request)
//            saveDataToCache(with: requestedData, and: response)
            data = requestedData
//        }
        
        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    }
    
    final func loadImage(nsurl: NSURL) async throws -> UIImage? {
        if let cachedImage = image(url: nsurl) {
            return cachedImage
        }
        
        guard let url = nsurl.absoluteURL else { return nil }
        let (data, _) = try await URLSession.shared.data(from: url)
        if let image = UIImage(data: data) {
            self.cachedImages.setObject(image, forKey: nsurl)
            return image
        }
        
        return .add
    }
    
    private final func image(url: NSURL) -> UIImage? {
        return cachedImages.object(forKey: url)
    }

    
    // MARK: - Section Of Adding Images to Stash or donwload it from Stash
    
    private func saveDataToCache(with data: Data, and responce: URLResponse) {
        guard let url = responce.url else { return }
        let request = URLRequest(url: url)
        let cachedResponce = CachedURLResponse(response: responce, data: data)
        URLCache.shared.storeCachedResponse(cachedResponce, for: request)
    }
    
    private func getDataFromCache(from request: URLRequest) -> Data? {
        URLCache.shared.cachedResponse(for: request)?.data
    }
    
}
