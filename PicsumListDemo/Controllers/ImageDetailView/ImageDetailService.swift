//
//  ImageDetailService.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 25/4/2566 BE.
//

import UIKit

class ImageDetailService {
    
    func loadImageDetail(url: String) async throws -> DetailDisplayModel {
        let data = try await APIManager.shared.request(endpoint: url, method: .get, headers: nil, body: nil)
        
        do {
            let responseDetailDisplay = try JSONDecoder().decode(DetailDisplayModel.self, from: data)
            print(responseDetailDisplay)
            return responseDetailDisplay
        } catch {
            print("Error decoding JSON: \(error)")
            throw error
        }
    }

    
//    func loadImageDetail(url: String, completion: @escaping (Result<DetailDisplayModel, Error>) -> Void) {
//        APIManager.shared.request(endpoint: url, method: .get, headers: nil, body: nil) { data, error in
//            guard let data = data, error == nil else {
//                completion(.failure(error ?? NSError(domain: "Unknown error", code: 0)))
//                return
//            }
//
//            do {
//                let responseDetailDisplay = try JSONDecoder().decode(DetailDisplayModel.self, from: data)
//                print(responseDetailDisplay)
//                completion(.success(responseDetailDisplay))
//            } catch {
//                print("Error decoding JSON: \(error)")
//                completion(.failure(error))
//            }
//
//        }
//    }
    
}
