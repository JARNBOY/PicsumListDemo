//
//  ImageDetailRouter.swift
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

@objc protocol ImageDetailRoutingLogic
{
    func routeToFullImage()
}

protocol ImageDetailDataPassing
{
    var dataStore: ImageDetailDataStore? { get }
}

class ImageDetailRouter: NSObject, ImageDetailRoutingLogic, ImageDetailDataPassing
{
    weak var viewController: ImageDetailViewController?
    var dataStore: ImageDetailDataStore?
    
    // MARK: Routing
    func routeToFullImage()
    {
        let storyboard = UIStoryboard(name: "FullImageStoryboard", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "FullImageViewController") as! FullImageViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToImageDetail(source: dataStore!, destination: &destinationDS)
        navigateToImageDetail(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
    
    func navigateToImageDetail(source: ImageDetailViewController, destination: FullImageViewController) {
        destination.modalPresentationStyle = .fullScreen
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToImageDetail(source: ImageDetailDataStore, destination: inout FullImageDataStore) {
        destination.imageDetailInfo = source.imageDetailInfo
    }
    
}
