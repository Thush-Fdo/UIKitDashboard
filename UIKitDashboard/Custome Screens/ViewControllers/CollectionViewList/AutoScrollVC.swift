//
//  AutoScrollVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 18/07/2024.
//

import UIKit

class AutoScrollVC: UIViewController {
    
    private var collectionView: UICollectionView!
    private var galleryItems: [Photo] = []
    let carouselLayout = UICollectionViewFlowLayout()
    let pageControl = UIPageControl()
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignData()
        configureCollectionView()
        configurePageControl()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Carousel Banner"
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollSetUp), userInfo: nil, repeats: true)
    }
    
    func configureCollectionView() {
        let cellPadding = (view.frame.width - 350) / 2
        carouselLayout.scrollDirection = .horizontal
        carouselLayout.itemSize = .init(width: 350, height: 250)
        carouselLayout.minimumLineSpacing = view.frame.width - 350
        carouselLayout.sectionInset = .zero
        carouselLayout.sectionInset = .init(top: 0, left: cellPadding, bottom: 0, right: cellPadding)
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: carouselLayout)
        
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: GalleryCell.cellID)
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func configurePageControl() {
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        pageControl.numberOfPages = galleryItems.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.yellow
        pageControl.currentPageIndicatorTintColor = UIColor.green
        
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -50),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc func scrollSetUp() {
        if currentIndex < galleryItems.count - 1 {
            currentIndex = currentIndex + 1
        } else {
            currentIndex = 0
        }
        
        pageControl.currentPage = currentIndex
        
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        collectionView.isPagingEnabled = true

    }
    
}

extension AutoScrollVC {
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
            Photo(image: Images.photoSample12),
            Photo(image: Images.photoSample13),
            Photo(image: Images.photoSample14)
        ]
    }
}

extension AutoScrollVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.cellID, for: indexPath) as! GalleryCell
        cell.set(photo: galleryItems[indexPath.row])
        return cell
    }
}

