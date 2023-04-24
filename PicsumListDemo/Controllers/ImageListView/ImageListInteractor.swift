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
    func doSomething(request: ImageList.Something.Request)
}

protocol ImageListDataStore
{
    //var name: String { get set }
}

class ImageListInteractor: ImageListBusinessLogic, ImageListDataStore
{
    var presenter: ImageListPresentationLogic?
    var worker: ImageListWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: ImageList.Something.Request)
    {
        worker = ImageListWorker()
        worker?.doSomeWork()
        
        let response = ImageList.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
