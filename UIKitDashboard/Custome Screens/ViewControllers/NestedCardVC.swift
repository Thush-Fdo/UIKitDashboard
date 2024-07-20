//
//  NestedCardVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 29/06/2024.
//

import UIKit

class NestedCardVC: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let topicLabel = UIKDTitleLabel(textalignment: .left, fontsize: 24)
    let subtitleLabel = UIKDSecondaryTitleLabel(fontSize: 16)
    var cardViewBgs: [UIView] = []
    
    let screenPadding: CGFloat = 15
    
    var contentViewHeightRequest: CGFloat = 0
    let requiredCardHeight: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        
        layoutLabels()
        configureScrollView()
        setInfo()
        createCardViews()
        configureCardUIs()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setContentViewScrolRequestHeight()
    }
    
    func layoutLabels() {
        view.addSubviews(topicLabel, subtitleLabel)
        let interPadding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            topicLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: screenPadding),
            topicLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: screenPadding),
            topicLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -screenPadding),
            topicLabel.heightAnchor.constraint(equalToConstant: 35),
            
            subtitleLabel.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: interPadding),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: screenPadding),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -screenPadding),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setInfo() {
        topicLabel.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
        topicLabel.text = "Debit Cards"
        subtitleLabel.text = "Below shows all the active cards. Please go to the card settings to activate and deactivate the cards. If have any queries, please contact the bank"
        
        subtitleLabel.numberOfLines = 0
        subtitleLabel.lineBreakMode = .byWordWrapping
        subtitleLabel.textAlignment = .justified
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 25),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func createCardViews() {
        for card in getCardData() {
            let cardbg = UIView(frame: .zero)
            configureUIelements(with: card, and: cardbg)
            
            cardbg.translatesAutoresizingMaskIntoConstraints = false
            cardbg.layer.cornerRadius = 10
            cardbg.clipsToBounds = true
            cardbg.layer.borderWidth = 0.5
            cardbg.layer.borderColor = UIColor.white.cgColor
            cardViewBgs.append(cardbg)
            contentView.addSubview(cardbg)
        }
        
        contentViewHeightRequest = (requiredCardHeight + CGFloat(20)) * CGFloat(getCardData().count)
    }
    
    func setContentViewScrolRequestHeight() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: contentViewHeightRequest)
        ])
    }
    
    func configureCardUIs() {
        var previousBGVIew = UIView()
        for bgview in cardViewBgs {
            
            if bgview == cardViewBgs.first {
                bgview.backgroundColor = .systemYellow
                NSLayoutConstraint.activate([
                    bgview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25)
                ])
            } else {
                bgview.backgroundColor = .systemGreen
                NSLayoutConstraint.activate([
                    bgview.topAnchor.constraint(equalTo: previousBGVIew.bottomAnchor, constant: 15)
                ])
            }
            
            previousBGVIew = bgview
            NSLayoutConstraint.activate([
                bgview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
                bgview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
                bgview.heightAnchor.constraint(equalToConstant: requiredCardHeight)
            ])
            
            bgview.backgroundColor = .systemPink
        }
    }
}

extension NestedCardVC {
    func getCardData() -> [CreditCard] {
        return [
            CreditCard(cardNickNname: "jdvisaone",
                       name: "Justin Victor Graham",
                       expiration: "10/25",
                       numberLabel: "1111 4321 5643 7869",
                       brand: "Visa",
                       brandImage: Images.visaLogo),
            
            CreditCard(cardNickNname: "jdmasterone",
                       name: "Kylie Fisher",
                       expiration: "12/24",
                       numberLabel: "1111 4321 5643 7869",
                       brand: "Master",
                       brandImage: Images.masterlogo),
            
            CreditCard(cardNickNname: "jdmasterone",
                       name: "Jon Rexton Dawson",
                       expiration: "12/24",
                       numberLabel: "1111 4321 5643 7869",
                       brand: "Master",
                       brandImage: Images.masterlogo),
            
            CreditCard(cardNickNname: "jdmasterone",
                       name: "Megan Mathis",
                       expiration: "12/24",
                       numberLabel: "1111 4321 5643 7869",
                       brand: "American Express",
                       brandImage: Images.amexlogo)
        ]
    }
    
    func configureUIelements(with card: CreditCard, and view: UIView) {
        self.add(childVC: UIKDCardInfoVC(card: card), to: view)
    }
    
    func add(childVC: UIViewController, to containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
