//
//  CardViewCell.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 28/06/2024.
//

import UIKit

class CardViewCell: UITableViewCell {
    static let CategcellID = "CategCellID"
    let placeholderImage = Images.postplaceholder
    
    var bgView = UIView()
    var categImage = UIKDPostImageView(frame: .zero)
    var categTitle = UIKDTitleLabel(textalignment: .left, fontsize: 16)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        configureBackgroundView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func set(category: Category) {
        categImage.image = category.categoryImage
        categTitle.text = category.categoryName
    }
    
    func configureBackgroundView() {
        addSubview(bgView)
        bgView.addSubviews(categImage, categTitle)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 15
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            
            categImage.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            categImage.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: padding),
            categImage.widthAnchor.constraint(equalToConstant: 60),
            categImage.heightAnchor.constraint(equalToConstant: 60),
            
            categTitle.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            categTitle.leadingAnchor.constraint(equalTo: categImage.trailingAnchor, constant: padding),
            categTitle.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -padding),
            categTitle.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
