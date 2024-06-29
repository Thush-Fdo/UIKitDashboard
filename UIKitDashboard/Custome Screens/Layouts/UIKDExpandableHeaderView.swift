//
//  UIKDExpandableHeaderView.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 29/06/2024.
//

import UIKit

protocol UIKDExpandableHeaderViewDelegate {
    func toggleSection(header: UIKDExpandableHeaderView, section: Int)
}

class UIKDExpandableHeaderView: UITableViewHeaderFooterView {
    
    static let cellID = "ExpandableHeadViewID"
    
    var titleLabel = UIKDTitleLabel(textalignment: .left, fontsize: 16)
    var subtitleLabel = UIKDSecondaryTitleLabel(fontSize: 12)
    
    var delegate: UIKDExpandableHeaderViewDelegate?
    var section: Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureHeaderView()
        addTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeaderView() {
        contentView.addSubviews(titleLabel, subtitleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 15),
        ])
    }
    
    func addTapGesture() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView)))
    }
    
    @objc func selectHeaderView(gesture: UITapGestureRecognizer) {
        let cell = gesture.view as! UIKDExpandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func customInit(title: String, subtitle: String, section: Int, delegate: UIKDExpandableHeaderViewDelegate ) {
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel.textColor = .white
        self.subtitleLabel.textColor = .white
        self.subtitleLabel.alpha = 0.7
        self.contentView.backgroundColor = .darkGray
    }
}

