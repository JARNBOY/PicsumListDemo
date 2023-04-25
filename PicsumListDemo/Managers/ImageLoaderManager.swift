//
//  ImageLoaderManager.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 24/4/2566 BE.
//

import UIKit

class ImageLoaderManager {
    static let shared = ImageLoaderManager()
    
    //MARK: LoadImage
    func loadImage(from url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        APIManager.shared.request(endpoint: url, method: .get, headers: nil, body: nil) { data, error in
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
    }
    
    func loadImageData(from url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        APIManager.shared.request(endpoint: url, method: .get, headers: nil, body: nil) { data, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "Unknown error", code: 0)))
                return
            }
            completion(.success(data))
        }
    }
    
    //MARK: path URL Image From PICSUM
    func getURLSpecificImageLoad(
        id: Int ,
        widthImg: Int = widthImage,
        heightImg: Int = heightImage
    ) -> String {
        let idPath = "/id/\(id)"
        let widthHeightPath = "/\(widthImg)/\(heightImg)"
        return "\(rootImageURL)\(pathImageURL)\(idPath)\(widthHeightPath)"
    }
    
    func getURLImageDetail(id: Int) -> String {
        let idPath = "/id/\(id)"
        return "\(rootImageURL)\(pathImageURL)\(idPath)/info"
    }
    
    func getURLBlurImage(
        id: Int ,
        widthImg: Int = widthImage,
        heightImg: Int = heightImage,
        blur: Int
    ) -> String {
        let idPath = "/id/\(id)"
        let widthHeightPath = "/\(widthImg)/\(heightImg)"
        let blurPath = "/?blur=\(blur)"
        return "\(rootImageURL)\(pathImageURL)\(idPath)\(widthHeightPath)\(blurPath)"
    }
    
    func getURLGrayScaleImage(
        id: Int ,
        widthImg: Int = widthImage,
        heightImg: Int = heightImage
    ) -> String {
        let idPath = "/id/\(id)"
        let widthHeightPath = "/\(widthImg)/\(heightImg)"
        return "\(rootImageURL)\(pathImageURL)\(idPath)\(widthHeightPath)?grayscale"
    }
}
