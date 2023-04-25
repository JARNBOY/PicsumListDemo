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
    func getImagesPicsum()
    func setCurrentIndex(index: Int)
    func fetchMoreImagesPicsum()
    func openDetailImage(id: Int)
}

protocol ImageListDataStore
{
    var idImageDetail: Int { get set }
}

class ImageListInteractor: ImageListBusinessLogic, ImageListDataStore
{
    
    var presenter: ImageListPresentationLogic?
    var worker: ImageListWorker = ImageListWorker()
    
    var idImageDetail: Int = 0
    
    private var currentIndex = 0
    private var startIndex = 0
    private var maxImageFetch = 25
    
    // MARK: ImageListBusinessLogic
    
    func getImagesPicsum() {
        self.startIndex = self.currentIndex
        let maxImage = self.startIndex + self.maxImageFetch
        let endIndex = maxImage - 1
        worker.generateListURL(startIndex: self.startIndex, endIndex: endIndex) { imageUrls in
            print(imageUrls)
            let response = ImageList.FetchImageURL.Response(startIndex: startIndex, endIndex: endIndex, urls: imageUrls)
            presenter?.presentGetImagesPicsum(response: response)
        }
    }
    
    func setCurrentIndex(index: Int) {
        self.currentIndex = index
        print("index : \(self.currentIndex)")
    }
    
    func fetchMoreImagesPicsum() {
        let maxImage = self.startIndex + self.maxImageFetch
        let endIndex = maxImage - 1
        if self.currentIndex >= endIndex {
            self.currentIndex = self.startIndex + self.maxImageFetch
            self.getImagesPicsum()
        }
    }
    
    func openDetailImage(id: Int) {
        idImageDetail = id
        presenter?.presentOpenDetailImage()
    }
    
}
