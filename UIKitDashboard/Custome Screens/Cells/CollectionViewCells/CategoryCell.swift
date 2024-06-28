//
//  CategoryCell.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 27/06/2024.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let cellID = "CategoryCellID"
    let categoryImagePlaceholder = Images.postplaceholder
    
    let categImage = UIKDPostImageView(frame: .zero)
    let categLabel = UIKDTitleLabel(textalignment: .center, fontsize: 18)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCategoryImage()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categImage.layer.borderWidth = 1
        categImage.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categImage.image = categoryImagePlaceholder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCategoryImage() {
        addSubviews(categImage, categLabel)
        categImage.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            categImage.topAnchor.constraint(equalTo: topAnchor),
            categImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            categImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            categImage.bottomAnchor.constraint(equalTo: categLabel.topAnchor, constant: -10),
            
            categLabel.heightAnchor.constraint(equalToConstant: 20),
            categLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            categLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            categLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    func set(category: Category) {
        categImage.image = category.categoryImage
        categLabel.text = category.categoryName
    }
}
