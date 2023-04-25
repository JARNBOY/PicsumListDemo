//
//  ImageListWorker.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 24/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ImageListWorkerInterface {
    func generateListURL(startIndex: Int, endIndex: Int, success:([String]) -> Void)
//    func loadImage(url: String, success:@escaping (UIImage) -> Void, fail:@escaping (Error) -> Void)
}

class ImageListWorker: ImageListWorkerInterface
{
    
//    var service: ImageListService!
//
//    init(service: ImageListService) {
//        self.service = service
//    }
    
    func generateListURL(startIndex: Int, endIndex: Int, success:([String]) -> Void) {
        let listImageURL = (startIndex...endIndex).map {
            ImageLoaderManager.shared.getURLSpecificImageLoad(id: $0)
        }
        success(listImageURL)
    }
    
//    func loadImage(url: String, success:@escaping (UIImage) -> Void, fail:@escaping (Error) -> Void) {
//        service.loadImage(url: url) { result in
//            switch result {
//            case .success(let img):
//                success(img)
//            case .failure(let error):
//                fail(error)
//            }
//        }
//    }
    
    
}
