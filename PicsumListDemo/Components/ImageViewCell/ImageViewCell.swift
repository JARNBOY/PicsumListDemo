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
    
    func configureCell(imageUrl: URL) {
        let imgCacheData = ImageCache.shared.image(forKey: imageUrl.absoluteString)
        if let imageCache = imgCacheData {
            self.imgV.image = imageCache
            print("load image cache")
        } else {
            ImageLoaderManager.shared.loadImage(from: imageUrl) {[weak self] result in
                guard let self = self else { return }
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
}
