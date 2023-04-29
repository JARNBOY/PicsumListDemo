//
//  ImageViewCell.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 24/4/2566 BE.
//

import UIKit

protocol ImageViewCellDelegate {
    func keepCacheImage(urlCache: String,imageCache: UIImage?)
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
    
    func configureCell(imageUrl: String) {
        Task { @MainActor in
            do {
                let imageDisplay = try await ImageLoaderManager.shared.loadImage(from: imageUrl)
                imgV.image = imageDisplay
                self.delegate?.keepCacheImage(urlCache: imageUrl, imageCache: imageDisplay)
            } catch {
                imgV.image = nil
                self.delegate?.keepCacheImage(urlCache: imageUrl, imageCache: nil)
            }
        }
    }
}
