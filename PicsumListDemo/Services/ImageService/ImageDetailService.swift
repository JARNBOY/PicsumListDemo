//
//  ImageDetailService.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 25/4/2566 BE.
//

import UIKit

typealias Response<T> = Result<T, Error>
typealias ImageDetailCompletion<T> = (Response<T>) -> Void

protocol ImageDetailServiceInterface {
    func loadImageDetail<T: Decodable>(url: String, completion: @escaping ImageDetailCompletion<T>)
}
