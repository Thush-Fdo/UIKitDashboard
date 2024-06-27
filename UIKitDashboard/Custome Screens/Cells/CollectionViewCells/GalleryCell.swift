//
//  GalleryCell.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 27/06/2024.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    static let cellID = "GalleryCellID"
    let galleryPlaceholderImage = Images.postplaceholder
    
    let galleryImage = UIKDPostImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGalleryImage()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        galleryImage.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        galleryImage.image = galleryPlaceholderImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureGalleryImage() {
        addSubview(galleryImage)
        galleryImage.contentMode = .scaleToFill
        
        NSLayoutConstraint.activate([
            galleryImage.topAnchor.constraint(equalTo: topAnchor),
            galleryImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            galleryImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            galleryImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func set(photo: Photo) {
        galleryImage.image = photo.image
    }
}
