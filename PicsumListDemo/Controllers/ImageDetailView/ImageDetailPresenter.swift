//
//  ImageDetailPresenter.swift
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

protocol ImageDetailPresentationLogic
{
    func presentGetImageDetail(response: ImageDetail.GetDetailDisplay.Response)
    func presentGetBlurImage(imageBlur: UIImage)
    func presentGetGrayScaleImage(imageGrayScale: UIImage)
}

class ImageDetailPresenter: ImageDetailPresentationLogic
{
    weak var viewController: ImageDetailDisplayLogic?
    
    // MARK: ImageDetailPresentationLogic
    
    func presentGetImageDetail(response: ImageDetail.GetDetailDisplay.Response)
    {
        let imageData = response.imageData
        let author = response.displayModel.author
        let desc = "id: \(response.displayModel.id)\nsize (Width x Height): \(response.displayModel.width) x \(response.displayModel.height)\nurl: \(response.displayModel.url)\ndownload_url: \(response.displayModel.downloadUrl)"
        
        let viewModel = ImageDetail.GetDetailDisplay.ViewModel(imageData: imageData, author: author, desc: desc)
        viewController?.displayGetImageDetail(viewModel: viewModel)
    }
    
    func presentGetBlurImage(imageBlur: UIImage) {
        viewController?.displayGetBlurImage(imageBlur: imageBlur)
    }
    
    func presentGetGrayScaleImage(imageGrayScale: UIImage) {
        viewController?.displayGetGrayScaleImage(imageGrayScale: imageGrayScale)
    }
    
}
