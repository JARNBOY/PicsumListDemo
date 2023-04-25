//
//  ImageDetailInteractor.swift
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

protocol ImageDetailBusinessLogic
{
    func getImageDetail()
    func getBlurImage(blur: Double)
    func getGrayScaleImage()
}

protocol ImageDetailDataStore
{
    var imageDetailInfo: ImageDetailInfo? { get set }
}

class ImageDetailInteractor: ImageDetailBusinessLogic, ImageDetailDataStore
{
    
    
    var presenter: ImageDetailPresentationLogic?
    var worker: ImageDetailWorker = ImageDetailWorker(service: ImageDetailService())
    
    var imageDetailInfo: ImageDetailInfo? = nil
    
    // MARK: ImageDetailBusinessLogic
    
    func getImageDetail() {
        if let request = imageDetailInfo {
            worker.loadImageDetailInfo(id: request.idImageDetail) {[weak self] detailDisplayModel in
                guard let self = self else { return }
                let response = ImageDetail.GetDetailDisplay.Response(imageData: request.dataImageDetail, displayModel: detailDisplayModel)
                self.presenter?.presentGetImageDetail(response: response)
            } fail: { error in
                print(error.localizedDescription)
            }
        }
    }
    
    func getBlurImage(blur: Double) {
        if let request = imageDetailInfo {
            let id = request.idImageDetail
            var blurLevel = Int(blur * 10)
            if blurLevel < 1 {
                blurLevel = 1
            } else if blur > 10 {
                blurLevel = 10
            }
            let url = ImageLoaderManager.shared.getURLBlurImage(id: id, blur: blurLevel)
            worker.loadImageBlur(url: url) {[weak self] imageBlur in
                guard let self = self else { return }
                self.presenter?.presentGetBlurImage(imageBlur: imageBlur)
            } fail: { error in
                print(error.localizedDescription)
            }

        }
        
    }
    
    func getGrayScaleImage() {
        if let request = imageDetailInfo {
            let id = request.idImageDetail
            let url = ImageLoaderManager.shared.getURLGrayScaleImage(id: id)
            worker.loadImageGrayScale(url: url) {[weak self] imageGrayScale in
                guard let self = self else { return }
                self.presenter?.presentGetGrayScaleImage(imageGrayScale: imageGrayScale)
            } fail: { error in
                print(error.localizedDescription)
            }

        }
    }
}
