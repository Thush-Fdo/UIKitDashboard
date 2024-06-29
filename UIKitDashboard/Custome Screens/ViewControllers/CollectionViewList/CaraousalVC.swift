//
//  CaraousalVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 27/06/2024.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class CaraousalVC: UIViewController {
    
    private var collectionView: UICollectionView!
    private var dogBreedList: [Dog] = []
    
    let bottomView = UIView()
    let lifeSpanLabel = UIKDSecondaryTitleLabel(fontSize: 15)
    let sizeAndWeightLabel = UIKDSecondaryTitleLabel(fontSize: 15)
    let descLabel = UIKDBodyLabel(textalignment: .justified)
    let layout = UIKDCustomFlowLayout()
    
    var itemW: CGFloat {
        return screenWidth * 0.5
    }
    
    var itemH: CGFloat {
        return itemW * 1.2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confgiureFlowLayout()
        configureCollectionView()
        layoutUI()
        configureBottomView()
        assignData()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Dog Breeds"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupInitialCell()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()        
        descLabel.sizeToFit()
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 50.0, bottom: 0.0, right: 50.0)
        
        collectionView.register(DogCell.self, forCellWithReuseIdentifier: DogCell.cellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func confgiureFlowLayout() {
        layout.scrollDirection = .horizontal
        layout.itemSize.width = itemW
        layout.minimumLineSpacing = 50.0
        layout.minimumInteritemSpacing = 50.0
    }
    
    func setupInitialCell() {
        let indexPath = IndexPath(item: 0, section: 0)
        guard let collectionView = collectionView else { return }
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        layout.currentPage = indexPath.item
        layout.previousOffset = layout.updateOffset(collectionView)
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            transformCell(cell)
        }
    }
    
    func layoutUI() {
        view.addSubviews(collectionView, bottomView)
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.width),
            
            bottomView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureBottomView() {
        bottomView.addSubviews(lifeSpanLabel, sizeAndWeightLabel, descLabel)
        descLabel.numberOfLines = 0        
        
        NSLayoutConstraint.activate([
            lifeSpanLabel.topAnchor.constraint(equalTo: bottomView.topAnchor),
            lifeSpanLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15),
            lifeSpanLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15),
            lifeSpanLabel.heightAnchor.constraint(equalToConstant: 20),
            
            sizeAndWeightLabel.topAnchor.constraint(equalTo: lifeSpanLabel.bottomAnchor, constant: 10),
            sizeAndWeightLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15),
            sizeAndWeightLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15),
            sizeAndWeightLabel.heightAnchor.constraint(equalToConstant:20),
            
            descLabel.topAnchor.constraint(equalTo: sizeAndWeightLabel.bottomAnchor, constant: 10),
            descLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15),
            descLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15),
            descLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor,constant: -25)
        ])
    }
}

extension CaraousalVC {
    func assignData() {
        dogBreedList = [
            Dog(name: "Dalmatian",
                petImage: Images.dalmatian,
                lifeSpan: "11 to 13 years",
                sizeAndWait: "30 to 31 kg and 19 to 24 inches",
                description: "Dalmatians are outgoing, intelligent, and curious. This friendly dog breed is the perfect pick for kids and fortunately does not have a biting problem. However, Dalmatians need early training and socializing since they can be aggressive around strangers. Since they were bred to protect other animals (horses primarily), they might do the same for their family and lash out at strangers. "),
            
            Dog(name: "Dobermann",
                petImage: Images.dobermann,
                lifeSpan: "10 to 12 years",
                sizeAndWait: "27 to 46 kg and 24 to 28 inches",
                description: "Dobermanns are loyal, courageous, and intelligent. However, pet parents need to be extremely patient, keeping this breed’s history as watchdogs in mind. Unlike most dog breeds, this Dobermanns are not for everyone. Since Dobermanns are active and athletic in nature, they need a consistent schedule and lots of positive reinforcement from their caregivers."),
            
            Dog(name: "German Shepherd",
                petImage: Images.germanshepherd,
                lifeSpan: "7 to 10 years",
                sizeAndWait: "22 to 40 kg and 22 to 26 inches",
                description: "German Shepherds are all about loyalty and will do anything to protect their family. This is why they make for excellent watchdogs and police dogs. This fearless breed is well-known for putting themselves in harm’s way to save their loved ones. If you have a German Shepherd at home, you will know the second someone starts approaching your house. Since they are such a protective breed, early socializing is extremely important for them to know that not everything is a threat."),
            
            Dog(name: "Labrador",
                petImage: Images.labrador,
                lifeSpan: "11 to 13 years",
                sizeAndWait: "24 to 36 kg and 21 to 25 inches",
                description: "Cheerful and high-spirited, Labradors will have a lot of energy to spare with you and your family. If you are a family that loves outdoor sports and activities, your Lab will most definitely be an addition to the team. Playing with your Labrador and taking it out for activities like running, swimming, and playing fetch is the perfect way to funnel its energy into something positive. This highly intelligent dog breed is easy to train because they easily pick up on commands and tricks, making your job as a house trainer easier. Labradors also love having a job to do like fetching or retrieving things."),
            
            Dog(name: "Rottweiler",
                petImage: Images.rottweiler,
                lifeSpan: "9 to 10 years",
                sizeAndWait: "36 to 61 kg and 22 to 27 inches",
                description: "Rottweilers possess a gentle and playful nature beneath their powerful exterior. They are not prone to excessive barking, making them relatively quiet dogs. While they are wonderful dogs, experienced owners are often better equipped to meet their specific training and exercise needs. These dogs thrive on activity and mental stimulation, reflecting their hard-working ancestry. They truly shine when given a 'job' to do, whether it be training, sports, or play. With proper socialization, Rottweilers can be excellent family dogs, adapting well to the energy and noise of children. They can also coexist peacefully with other pets, especially if raised in a multi-pet household.")
        ]
    }
}

extension CaraousalVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogBreedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DogCell.cellID, for: indexPath) as! DogCell
        cell.set(dog: dogBreedList[indexPath.row])
        setUpDogInfo(for: dogBreedList[layout.currentPage])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item != layout.currentPage {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            layout.currentPage = indexPath.item
            layout.previousOffset = layout.updateOffset(collectionView)
            setUpCell()
        }
    }
}

extension CaraousalVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemW, height: itemH)
    }
}

extension CaraousalVC {
    
    func setUpDogInfo(for dog: Dog) {
        lifeSpanLabel.text = dog.lifeSpan
        sizeAndWeightLabel.text = dog.sizeAndWait
        descLabel.text = dog.description
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            setUpCell()
        }
    }
    
    private func setUpCell() {
        let indexPath = IndexPath(item: layout.currentPage, section: 0)
        if let cell = collectionView.cellForItem(at: indexPath) {
            setUpDogInfo(for: dogBreedList[indexPath.item])
            transformCell(cell)
        }
    }
    
    private func transformCell(_ cell: UICollectionViewCell, isEffect: Bool = true) {
        if !isEffect {
            cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            return
        }
        
        UIView.animate(withDuration: 0.2) {
            cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
        
        for otherCell in collectionView.visibleCells {
            if otherCell != cell {
                UIView.animate(withDuration: 0.2) {
                    otherCell.transform = .identity
                }
            }
        }
        
    }
}

