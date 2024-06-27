//
//  VideoCell.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 26/06/2024.
//

import UIKit

class VideoCell: UITableViewCell {
    
    static let VideocellID = "VideoCellID"
    let placeholderImage = Images.postplaceholder
    
    var videoImageVIew = UIImageView()
    var videoTItleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(videoImageVIew)
        addSubview(videoTItleLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(video: Video) {
        videoImageVIew.image = video.image
        videoTItleLabel.text = video.title
    }
    
    func configureImageView() {
        videoImageVIew.image = placeholderImage
        videoImageVIew.layer.cornerRadius = 10
        videoImageVIew.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        videoTItleLabel.numberOfLines = 0
        videoTItleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        videoImageVIew.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoImageVIew.centerYAnchor.constraint(equalTo: centerYAnchor),
            videoImageVIew.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            videoImageVIew.heightAnchor.constraint(equalToConstant: 80),
            videoImageVIew.widthAnchor.constraint(equalTo: videoImageVIew.heightAnchor , multiplier: 16/9)
        ])
    }
    
    func setTitleLabelConstraints() {
        videoTItleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoTItleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            videoTItleLabel.leadingAnchor.constraint(equalTo: videoImageVIew.trailingAnchor, constant: 20),
            videoTItleLabel.heightAnchor.constraint(equalToConstant: 80),
            videoTItleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}
