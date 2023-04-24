//
//  ImageListInteractor.swift
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

protocol ImageListBusinessLogic
{
    func fetchImagesPicsum()
    func loadImage(url: String ,row: Int)
}

protocol ImageListDataStore
{
    var imageURLDetail: String { get set }
}

class ImageListInteractor: ImageListBusinessLogic, ImageListDataStore
{
    var presenter: ImageListPresentationLogic?
    var worker: ImageListWorker = ImageListWorker(service: ImageListService())
    
    var imageURLDetail: String = ""
    private var currentIndex = 0
    private var maxImageFetch = 300
    
    // MARK: ImageListBusinessLogic
    
    func fetchImagesPicsum() {
        let startIndex = self.currentIndex
        let endIndex = startIndex + self.maxImageFetch
        worker.generateListURL(startIndex: startIndex, endIndex: endIndex) { imageUrls in
            let response = ImageList.FetchImageURL.Response(startIndex: startIndex, endIndex: endIndex, urls: imageUrls)
            presenter?.presentGetImagesPicsum(response: response)
        }
    }
    
    func loadImage(url: String ,row: Int) {
        worker.loadImage(url: url) { img in
            self.presenter?.presentLoadImage(response: ImageList.GetImage.Response(rowUpdate: row, img: img))
        } fail: { err in
            self.presenter?.presentLoadImage(response: ImageList.GetImage.Response(rowUpdate: row, img: nil))
        }

    }
}
