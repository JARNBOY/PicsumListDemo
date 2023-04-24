//
//  CollectionViewCell.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 25/4/2566 BE.
//

import UIKit

extension UICollectionViewCell {
    
    func fadeAnimation() {
        self.alpha = 0.0
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1.0
        }
    }
}
