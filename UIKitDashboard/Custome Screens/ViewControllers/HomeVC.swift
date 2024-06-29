//
//  ViewController.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 26/06/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    private var tableView = UITableView(frame: .zero, style: .plain)
    private let cellID = "CellID"
    private var mainViewList: [MainViewList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        assignData()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "UIKit Dashboard"
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

extension HomeVC {
    func assignData() {
        mainViewList = [
            MainViewList(name: "Table Views", viewController: TableHomeVC()),
            MainViewList(name: "Collection Views", viewController: CollectionHomeVC()),
            MainViewList(name: "Nested Card View", viewController: NestedCardVC())
        ]
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = mainViewList[indexPath.row].name
        return cell!
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(mainViewList[indexPath.row].viewController, animated: true)
    }
}

