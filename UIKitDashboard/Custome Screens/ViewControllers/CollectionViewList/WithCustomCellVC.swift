//
//  WithCustomCellVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 27/06/2024.
//

import UIKit

class WithCustomCellVC: UIViewController {
    
    private var collectionView: UICollectionView!
    private var galleryItems: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBarButtons()
        configureCollectionView()
        assignData()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Photo Gallery"
    }
    
    func configureNavBarButtons() {
        let two = UIBarButtonItem(title: "02 Col", style: .plain, target: self, action: #selector(callTwoLayerFlowLayout))
        let three = UIBarButtonItem(title: "03 Col", style: .plain, target: self, action: #selector(callThreeLayerFlowLayout))
        navigationItem.rightBarButtonItems = [three, two]
    }
    
    @objc func callTwoLayerFlowLayout() {
        collectionView.setCollectionViewLayout(UIHelper.createTwoColumnFlowLayout(in: view), animated: true)
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
    }
    
    @objc func callThreeLayerFlowLayout() {
        collectionView.setCollectionViewLayout(UIHelper.createThreeColumnFlowLayout(in: view), animated: true)
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: GalleryCell.cellID)
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

extension WithCustomCellVC {
    func assignData() {
        galleryItems = [
            Photo(image: Images.photoSample1),
            Photo(image: Images.photoSample2),
            Photo(image: Images.photoSample3),
            Photo(image: Images.photoSample4),
            Photo(image: Images.photoSample5),
            Photo(image: Images.photoSample6),
            Photo(image: Images.photoSample7),
            Photo(image: Images.photoSample8),
            Photo(image: Images.photoSample9),
            Photo(image: Images.photoSample10),
            Photo(image: Images.photoSample11),
            Photo(image: Images.photoSample13),
            Photo(image: Images.photoSample13),
            Photo(image: Images.photoSample14)
        ]
    }
}

extension WithCustomCellVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.cellID, for: indexPath) as! GalleryCell
        cell.set(photo: galleryItems[indexPath.row])
        return cell
    }
}
