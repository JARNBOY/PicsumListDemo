//
//  ImageViewCell.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 24/4/2566 BE.
//

import UIKit

protocol ImageViewCellDelegate {
    func keepCacheImage(urlCache: URL,imageCache: UIImage?)
}

class ImageViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgV: UIImageView!
    var delegate: ImageViewCellDelegate? = nil
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgV.image = nil
    }
    
    func setImageCache(image: UIImage) {
        self.imgV.image = image
        print("load image cache")
    }
    
    func configureCell(imageUrl: URL) {
        ImageLoaderManager.shared.loadImage(from: imageUrl) {[weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let img):
                    self.imgV.image = img
                    self.delegate?.keepCacheImage(urlCache: imageUrl, imageCache: img)
                    print("load image success")
                case .failure(_):
                    self.imgV.image = nil
                    self.delegate?.keepCacheImage(urlCache: imageUrl, imageCache: nil)
                    print("load image fail")
                }
            }
        }
    }
}
