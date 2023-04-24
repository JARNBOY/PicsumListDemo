//
//  ImageViewCell.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 24/4/2566 BE.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgV: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgV.image = nil
    }
    
    func setImageCache(img: UIImage?) {
        if let img = img {
            self.imgV.image = img
            print("load image cache")
        }
    }
    
    func configureCell(imageUrl: URL) {
        ImageLoaderManager.shared.loadImage(from: imageUrl) { result in
            switch result {
            case .success(let img):
                DispatchQueue.main.async {
                    self.imgV.image = img
                    print("load image success")
                }
            case .failure(_):
                print("load image fail")
            }
        }
        
    }
}
