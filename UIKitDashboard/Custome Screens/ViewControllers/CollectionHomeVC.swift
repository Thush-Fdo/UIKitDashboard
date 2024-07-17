//
//  CollectionHomeVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 26/06/2024.
//

import UIKit

class CollectionHomeVC: UIViewController {
    
    private var tableView = UITableView(frame: .zero, style: .plain)
    private let cellID = "CellID"
    private var collectionViewList: [CollectionViewList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        assignData()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Collection View List"
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = 60
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CollectionHomeVC {
    func assignData() {
        collectionViewList = [
            CollectionViewList(name: "Basic Two Column Grid View", viewController: BasicGridVC()),
            CollectionViewList(name: "Grid for Two and Three Columns", viewController: WithCustomCellVC()),
            CollectionViewList(name: "Caraousal View", viewController: CaraousalVC()),
            CollectionViewList(name: "Auto Scroll Images", viewController: AutoScrollVC())
        ]
    }
}

extension CollectionHomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionViewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = collectionViewList[indexPath.row].name
        return cell!
    }
}

extension CollectionHomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(collectionViewList[indexPath.row].viewController, animated: true)
    }
}
