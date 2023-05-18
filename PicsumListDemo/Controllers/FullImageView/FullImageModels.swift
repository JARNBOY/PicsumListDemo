//
//  FullImageModels.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 18/5/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum FullImage
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
            var url: String
        }
    }
}