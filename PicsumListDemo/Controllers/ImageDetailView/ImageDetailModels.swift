//
//  ImageDetailModels.swift
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

enum ImageDetail
{
    // MARK: Use cases
    
    enum GetDetailDisplay
    {
        struct Response
        {
            var imageData: Data
            var displayModel: DetailDisplayModel
        }
        struct ViewModel
        {
            var imageData: Data
            var author: String
            var desc: String
        }
    }
    
    
}

enum SegmentType: Int {
    case normal = 0
    case blur = 1
    case grayScale = 2
}
