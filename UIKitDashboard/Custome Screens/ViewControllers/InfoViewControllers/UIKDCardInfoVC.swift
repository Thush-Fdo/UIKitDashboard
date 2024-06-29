//
//  UIKDCardInfoVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 29/06/2024.
//

import UIKit

class UIKDCardInfoVC: UIViewController {
    
//    let background = UIKDCardDocketView(colors: [UIColor.systemGreen.cgColor, UIColor.systemYellow.cgColor])
    
    let background = UIKDCardDocketView(colors: UIHelper.getAvailableColurCombinations(for: 3, random: false))
    let brandTitleLabel = UIKDTitleLabel(textalignment: .left, fontsize: 20)
    let cardNumberLabel = UIKDTitleLabel(frame: .zero)
    let cardOwner = UIKDSecondaryTitleLabel(fontSize: 18)
    let brandImage = UIKDPostImageView(frame: .zero)
    
    var card: CreditCard!
    
    init(card: CreditCard) {
        super.init(nibName: nil, bundle: nil)
        self.card = card
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layoutUI()
        configureUIElements()
    }
    
    func configureUIElements() {
        brandTitleLabel.text = card.brand.uppercased()
        brandTitleLabel.textColor = .white
        
        cardNumberLabel.text = card.numberLabel
        cardNumberLabel.textColor = .white
        cardNumberLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 25)
        cardNumberLabel.textAlignment = .center
        
        cardOwner.text = card.name
        cardOwner.textColor = .white        
        cardOwner.minimumScaleFactor = 0.75
        
        brandImage.image = card.brandImage
        brandImage.contentMode = .scaleAspectFit
    }
    
    func addSubviews() {
        view.addSubviews(background, brandTitleLabel, cardNumberLabel, cardOwner, brandImage)
        background.pinToEdges(of: view)
    }
    
    func layoutUI() {
        let padding: CGFloat = 15
        brandImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            brandTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            brandTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            brandTitleLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            brandTitleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            brandImage.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -padding),
            brandImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            brandImage.widthAnchor.constraint(equalToConstant: 80),
            brandImage.heightAnchor.constraint(equalToConstant: 40),
            
            cardNumberLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -padding * 2),
            cardNumberLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 90),
            cardNumberLabel.heightAnchor.constraint(equalToConstant: 40),
            
            cardOwner.centerYAnchor.constraint(equalTo: brandImage.centerYAnchor),
            cardOwner.leadingAnchor.constraint(equalTo: brandTitleLabel.leadingAnchor),
            cardOwner.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            cardOwner.heightAnchor.constraint(equalToConstant: 25)
        ])
    }    
}
