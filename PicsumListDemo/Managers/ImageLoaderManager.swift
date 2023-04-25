//
//  ImageLoaderManager.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 24/4/2566 BE.
//

import UIKit

class ImageLoaderManager {
    static let shared = ImageLoaderManager()
    
    var imageDataCache: [URL: Data?] = [:]
    
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
    
    func prefetchImageCacheUrl(imageURL: String) {
        // If the image is not already cached, fetch it from the server
        DispatchQueue.global(qos: .background).async {
            if ImageCache.shared.image(forKey: imageURL) == nil {
                let url = URL(string: imageURL)!
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    DispatchQueue.global().async {
                        if let error = error {
                            print("Error fetching image data: \(error.localizedDescription)")
                            return
                        }
                        
                        if let data = data, let image = UIImage(data: data) {
                            // Cache the image so that it can be quickly loaded when needed
                            ImageCache.shared.cacheImage(image, forKey: imageURL)
                        }
                    }
                    
                }
                // Start the data task to fetch the image data from the server
                task.resume()
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


class ImageCache {
    static let shared = ImageCache()
    
    private let cache = NSCache<NSString, UIImage>()
    
    func cacheImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}
