//
//  BasicGridVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 27/06/2024.
//

import UIKit

class BasicGridVC: UIViewController {
    
    private var collectionView: UICollectionView!
    private var categoryList: [Category] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        assignData()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Categories"
    }
    	
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.cellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
extension BasicGridVC {
    func assignData() {
        categoryList = [
            Category(categoryName: "Home Appliances", categoryImage: Images.appliances),
            Category(categoryName: "Books and Stationery", categoryImage: Images.books),
            Category(categoryName: "Cloths", categoryImage: Images.cloths),
            Category(categoryName: "Gadgets", categoryImage: Images.electronics),
            Category(categoryName: "Furniture", categoryImage: Images.furniture),
            Category(categoryName: "Kitchen Items", categoryImage: Images.homeandkitchen),
            Category(categoryName: "Kid's Toys", categoryImage: Images.kidstoys),
            Category(categoryName: "Men's Accessories", categoryImage: Images.mensaccessories),
            Category(categoryName: "Women's Accessories", categoryImage: Images.womensaccessories)
        ]
    }
}

extension BasicGridVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.cellID, for: indexPath) as! CategoryCell
        cell.set(category: categoryList[indexPath.row])
        return cell
    }
}

