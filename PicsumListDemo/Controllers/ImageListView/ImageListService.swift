//
//  ImageListService.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 25/4/2566 BE.
//

import UIKit

class ImageListService {
    
    func loadImage(url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        let urlRequest = URL(string: url)
        
        ImageLoaderManager.shared.loadImage(from: urlRequest) { result in
            completion(result)
        }
    }
    
}
