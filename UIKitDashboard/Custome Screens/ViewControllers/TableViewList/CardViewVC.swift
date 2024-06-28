//
//  CardViewVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 28/06/2024.
//

import UIKit

class CardViewVC: UIViewController {
    
    private var tableView = UITableView(frame: .zero, style: .plain)
    private var categoryList: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Categories"
        assignData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        //        tableView.rowHeight = 120
        //
        //        tableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
        
        tableView.register(CardViewCell.self, forCellReuseIdentifier: CardViewCell.CategcellID)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.pinToEdges(of: view)
    }
}

extension CardViewVC {
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

extension CardViewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardViewCell.CategcellID) as! CardViewCell
        let category = categoryList[indexPath.row]
        cell.set(category: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.contentView.backgroundColor = UIColor.clear
//        let whiteRoundedView = UIView(frame: CGRectMake(15, 15, self.view.frame.size.width - 30, 90))
//        whiteRoundedView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 1.0])
//        whiteRoundedView.layer.masksToBounds = false
//        whiteRoundedView.layer.cornerRadius = 3.0
//        whiteRoundedView.layer.shadowOffset = CGSizeMake(-1, 1)
//        whiteRoundedView.layer.shadowOpacity = 0.5
//        
//        if !cell.contentView.subviews.contains(whiteRoundedView) {
//            cell.contentView.addSubview(whiteRoundedView)
//        }
//        cell.contentView.sendSubviewToBack(whiteRoundedView)
//    }
}
