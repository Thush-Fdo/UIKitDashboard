//
//  UIKDAvatarImageView.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 26/06/2024.
//

import UIKit

class UIKDAvatarImageView: UIImageView {
    
    let avatarPlaceholderImage = Images.avatarplaceholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = bounds.height / 2
    }
    
    private func configure(){
        clipsToBounds = true
        image = avatarPlaceholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
