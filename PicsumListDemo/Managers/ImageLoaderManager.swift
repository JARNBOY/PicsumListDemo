//
//  ImageLoaderManager.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 24/4/2566 BE.
//

import UIKit

class ImageLoaderManager {
    static let shared = ImageLoaderManager()
    
    var imageDataCache: [URL: Data] = [:]
    
    //MARK: LoadImage
    func loadImage(from url: URL?, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(NSError(domain: "Url is empty", code: 0)))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "Unknown error", code: 0)))
                return
            }
            guard let image = UIImage(data: data) else {
                completion(.failure(NSError(domain: "Failed to convert data to image", code: 0)))
                return
            }
            completion(.success(image))
        }
        task.resume()
    }
    
    func prefetchImageUrls(_ urls: [URL]) {
        // Prefetch image data for the specified URLs
        urls.forEach { url in
            if imageDataCache[url] == nil {
                // Load image data asynchronously
                DispatchQueue.global(qos: .background).async {
                    if let imageData = try? Data(contentsOf: url) {
                        // Cache the loaded image data
                        self.imageDataCache[url] = imageData
                    }
                }
            }
        }
    }
    
    //MARK: TemplatURL Image
    func generateURLImageLoad(id:Int) -> String {
        let idPath = "/id/\(id)"
        let widthHeightPath = "/\(widthImage)/\(heightImage)"
        return "\(rootImageURL)\(pathImageURL)\(idPath)\(widthHeightPath)"
    }
}
