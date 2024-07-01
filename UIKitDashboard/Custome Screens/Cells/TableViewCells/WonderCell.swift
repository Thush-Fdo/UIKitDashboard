//
//  WonderCell.swift
//  UIKitDashboard
//
//  Created by Shermin Fernando on 29/06/2024.
//

import UIKit

class WonderCell: UITableViewCell {
    
    static let WonderCellID = "WonderCellID"
    let placeholderImage = Images.postplaceholder
    
    var wonderTItleLabel = UIKDTitleLabel(textalignment: .left, fontsize: 16)
    var wonderImageVIew = UIKDPostImageView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(wonderTItleLabel)
        addSubview(wonderImageVIew)
        
        configureTitleLabel()
        configureImageView()
        setTitleLabelConstraints()
        setImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(wonder: Wonder) {
        wonderTItleLabel.text = wonder.name
        wonderImageVIew.image = wonder.image
    }
    
    func configureImageView() {
        wonderImageVIew.image = placeholderImage
        wonderImageVIew.layer.cornerRadius = 10
        wonderImageVIew.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        wonderTItleLabel.numberOfLines = 0
        wonderTItleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            wonderTItleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            wonderTItleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            wonderTItleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        let constraint = wonderTItleLabel.heightAnchor.constraint(equalToConstant: 20)
        constraint.priority = UILayoutPriority(999)
        constraint.isActive = true
    }
    
    func setImageConstraints() {
        NSLayoutConstraint.activate([
            wonderImageVIew.topAnchor.constraint(equalTo: wonderTItleLabel.bottomAnchor, constant: 10),
            wonderImageVIew.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            wonderImageVIew.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            wonderImageVIew.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
