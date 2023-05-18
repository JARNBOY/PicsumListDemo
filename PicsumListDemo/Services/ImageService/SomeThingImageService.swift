//
//  SomeThingImageService.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 18/5/2566 BE.
//

import Foundation

protocol SomeThingImageServiceInterface {
    func loadSomeThingImage(url: String, completion: @escaping (Result<SomeThingInfoModel, Error>) -> Void)
}
