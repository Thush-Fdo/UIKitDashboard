//
//  StickyHeader.swift
//  UIKitDashboard
//
//  Created by Shermin Fernando on 20/07/2024.
//

import UIKit

class UIKDStickyHeader: UICollectionReusableView {
    
    let headerImageBg = UIKDPostImageView(frame: .zero)
    let blurEffect = UIBlurEffect(style: .regular)
    var visualEffectView: UIVisualEffectView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGalleryImage()
//        setupBlurEffect()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImageBg.layer.borderWidth = 1
        headerImageBg.layer.cornerRadius = 35
        headerImageBg.layer.borderColor = UIColor.systemGray2.cgColor
    }
    
    func setupBlurEffect() {        
        visualEffectView = UIVisualEffectView(effect: blurEffect)
        addSubview(visualEffectView)
        visualEffectView.pinToEdges(of: self)
    }
    
    func configureGalleryImage() {
        addSubviews(headerImageBg)
        headerImageBg.contentMode = .scaleAspectFill
        
        headerImageBg.image = UIImage(named: "sampleHeader")
        
        NSLayoutConstraint.activate([
            headerImageBg.topAnchor.constraint(equalTo: topAnchor),
            headerImageBg.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImageBg.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImageBg.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
