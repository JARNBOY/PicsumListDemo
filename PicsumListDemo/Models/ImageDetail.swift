//
//  ImageDetail.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 25/4/2566 BE.
//

import Foundation

struct ImageDetailInfo {
    var idImageDetail: Int
    var dataImageDetail: Data
}

struct DetailDisplayModel: Codable {
    var id: String
    var author: String
    var width: Int
    var height: Int
    var url: String
    var downloadUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadUrl = "download_url"
    }
}

struct SomeThingInfoModel: Codable {
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case id
    }
}
