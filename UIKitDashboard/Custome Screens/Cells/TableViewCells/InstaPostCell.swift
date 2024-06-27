//
//  InstaPostCell.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 26/06/2024.
//

import UIKit

class InstaPostCell: UITableViewCell {
    
    static let postCellID = "PostCellID"
    let postPlaceholderImage = Images.postplaceholder
    
    var headerView = UIView()
    var postImageView = UIKDPostImageView(frame: .zero)
    var buttonBarView = UIView()
    var captionView = UIView()
    
    var avatar = UIKDAvatarImageView(frame: .zero)
    var username = UIKDTitleLabel(textalignment: .left, fontsize: 16)
    var location = UIKDSecondaryTitleLabel(fontSize: 12)
    
    var heartImage = UIImageView()
    var commentImage = UIImageView()
    var shareImage = UIImageView()
    
    var likes = UIKDSecondaryTitleLabel()
    var caption = UIKDBodyLabel(textalignment: .justified)
    var time = UIKDSecondaryTitleLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(post: Post) {
        avatar.image = post.avatarImg
        username.text = post.name
        location.text = post.location
        postImageView.image = post.postImage
        caption.text = post.caption
        likes.text = "\(post.likes) likes"
        time.text = post.time
    }
    
    func layoutUI() {
        configureHeaderView()
        configurePostImage()
        configureButtonBarView()
        configureCaptionView()
        
        heartImage.image = SFSymbols.heart
        heartImage.tintColor = .secondaryLabel
        
        commentImage.image = SFSymbols.comment
        commentImage.tintColor = .secondaryLabel
        
        shareImage.image = SFSymbols.share
        shareImage.tintColor = .secondaryLabel
        
        likes.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        caption.numberOfLines = 0
        time.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    func configureHeaderView() {
        addSubview(headerView)
        headerView.addSubviews(avatar, username, location)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            
            avatar.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            avatar.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 45),
            avatar.heightAnchor.constraint(equalToConstant: 45),
            
            username.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 5),
            username.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: padding),
            username.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            username.heightAnchor.constraint(equalToConstant: 20),
            
            location.heightAnchor.constraint(equalToConstant: 15),
            location.bottomAnchor.constraint(equalTo: avatar.bottomAnchor, constant: -5),
            location.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: padding),
            location.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
        ])
    }
    
    func configurePostImage() {
        addSubview(postImageView)
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            postImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 9/16)
        ])
    }
    
    func configureButtonBarView() {
        addSubview(buttonBarView)
        buttonBarView.addSubviews(heartImage, commentImage, shareImage)
        buttonBarView.translatesAutoresizingMaskIntoConstraints = false
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        commentImage.translatesAutoresizingMaskIntoConstraints = false
        shareImage.translatesAutoresizingMaskIntoConstraints = false
        
        let outerPadding: CGFloat = 8
        let size: CGFloat = 30
        let leftPadding: CGFloat = 45
        
        NSLayoutConstraint.activate([
            buttonBarView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: outerPadding),
            buttonBarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: outerPadding),
            buttonBarView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -outerPadding),
            buttonBarView.heightAnchor.constraint(equalToConstant: 35),
            
            heartImage.centerYAnchor.constraint(equalTo: buttonBarView.centerYAnchor),
            heartImage.leadingAnchor.constraint(equalTo: buttonBarView.leadingAnchor),
            heartImage.widthAnchor.constraint(equalToConstant: size),
            heartImage.heightAnchor.constraint(equalToConstant: size),
            
            commentImage.centerYAnchor.constraint(equalTo: buttonBarView.centerYAnchor),
            commentImage.leadingAnchor.constraint(equalTo: heartImage.leadingAnchor, constant: leftPadding),
            commentImage.widthAnchor.constraint(equalToConstant: size),
            commentImage.heightAnchor.constraint(equalToConstant: size),
            
            shareImage.centerYAnchor.constraint(equalTo: buttonBarView.centerYAnchor),
            shareImage.leadingAnchor.constraint(equalTo: commentImage.leadingAnchor, constant: leftPadding),
            shareImage.widthAnchor.constraint(equalToConstant: size),
            shareImage.heightAnchor.constraint(equalToConstant: size)
        ])
    }
    
    func configureCaptionView() {
        addSubview(captionView)
        captionView.addSubviews(likes, caption, time)
        captionView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            captionView.topAnchor.constraint(equalTo: buttonBarView.bottomAnchor, constant: padding),
            captionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            captionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            captionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding * 2),
            
            likes.topAnchor.constraint(equalTo: captionView.topAnchor, constant: padding),
            likes.leadingAnchor.constraint(equalTo: captionView.leadingAnchor, constant: padding),
            likes.trailingAnchor.constraint(equalTo: captionView.trailingAnchor, constant: -padding),
            likes.heightAnchor.constraint(equalToConstant: 20),
            
            caption.topAnchor.constraint(equalTo: likes.bottomAnchor, constant: padding),
            caption.leadingAnchor.constraint(equalTo: captionView.leadingAnchor, constant: padding),
            caption.trailingAnchor.constraint(equalTo: captionView.trailingAnchor, constant: -padding),
            caption.bottomAnchor.constraint(equalTo: time.topAnchor, constant: -padding),
            
            time.heightAnchor.constraint(equalToConstant: 15),
            time.leadingAnchor.constraint(equalTo: captionView.leadingAnchor, constant: padding),
            time.trailingAnchor.constraint(equalTo: captionView.trailingAnchor, constant: -padding),
            time.bottomAnchor.constraint(equalTo: captionView.bottomAnchor, constant: -padding)
        ])
    }
}
