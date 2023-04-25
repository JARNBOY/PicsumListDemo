//
//  Int.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 26/4/2566 BE.
//

import Foundation

extension Int {
    func toSegmentType() -> SegmentType {
        switch self {
        case 0: return .normal
        case 1: return .blur
        case 2: return .grayScale
        default:
            return .normal
        }
    }
}
