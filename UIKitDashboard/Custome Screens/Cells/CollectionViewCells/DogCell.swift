//
//  DogCell.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 27/06/2024.
//

import UIKit

class DogCell: UICollectionViewCell {
    
    static let cellID = "DogCellID"
    let dogPlaceholderImage = Images.postplaceholder
    
    let dogNameTitle = UIKDTitleLabel(textalignment: .center, fontsize: 24)
    let dogImageView = UIKDPostImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGalleryImage()    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dogImageView.layer.borderWidth = 1
        dogImageView.layer.borderColor = UIColor.systemGray2.cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dogImageView.image = dogPlaceholderImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureGalleryImage() {
        addSubviews(dogNameTitle, dogImageView)
        dogImageView.contentMode = .scaleToFill
        
        NSLayoutConstraint.activate([
            dogNameTitle.topAnchor.constraint(equalTo: topAnchor),
            dogNameTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            dogNameTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            dogNameTitle.heightAnchor.constraint(equalToConstant: 20),
            
            dogImageView.topAnchor.constraint(equalTo: dogNameTitle.bottomAnchor, constant: 15),
            dogImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dogImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dogImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func set(dog: Dog) {
        dogImageView.image = dog.petImage
        dogNameTitle.text = dog.name
    }
}
