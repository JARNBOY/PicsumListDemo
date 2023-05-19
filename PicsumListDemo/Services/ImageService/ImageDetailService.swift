//
//  ImageDetailService.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 25/4/2566 BE.
//

import UIKit

protocol ImageDetailServiceInterface {
    func loadImageDetail<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void)
}
