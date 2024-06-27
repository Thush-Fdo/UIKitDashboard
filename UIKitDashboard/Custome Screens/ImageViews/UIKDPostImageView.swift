//
//  UIKDPostImageView.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 26/06/2024.
//

import UIKit

class UIKDPostImageView: UIImageView {
    
    let postPlaceholderImage = Images.postplaceholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius = 10
        clipsToBounds = true
        image = postPlaceholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
