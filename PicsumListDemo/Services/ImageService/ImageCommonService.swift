//
//  ImageCommonService.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 18/5/2566 BE.
//

import Foundation


class ImageCommonService: ImageDetailServiceInterface {
    func loadImageDetail<T: Decodable>(url: String, completion: @escaping ImageDetailCompletion<T>) {
        APIManager.shared.request(endpoint: url, method: .get, headers: nil, body: nil) { data, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "Unknown error", code: 0)))
                return
            }

            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                print(response)
                completion(.success(response))
            } catch {
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }
            
        }
    }
}

extension ImageCommonService: SomeThingImageServiceInterface {
    func loadSomeThingImage(url: String, completion: @escaping (Result<SomeThingInfoModel, Error>) -> Void) {
        APIManager.shared.request(endpoint: url, method: .get, headers: nil, body: nil) { data, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "Unknown error", code: 0)))
                return
            }

            do {
                let responseDetailDisplay = try JSONDecoder().decode(SomeThingInfoModel.self, from: data)
                print(responseDetailDisplay)
                completion(.success(responseDetailDisplay))
            } catch {
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }
            
        }
    }
    
}
