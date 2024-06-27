//
//  CollapsibleTableVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 26/06/2024.
//

import UIKit

class CollapsibleTableVC: UIViewController {
    
    private var tableView = UITableView(frame: .zero, style: .plain)
    private let cellID = "CellID"
    private var users: [Users] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        assignData()
        navigationItem.title = "Collapsible Table View"
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.backgroundColor = .systemGray6
        
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

extension CollapsibleTableVC {
    func assignData() {
        users = [
            Users(isHidden: false, userGroup: "Directors", user: [User(name: "Chris"), User(name: "Kate")]),
            Users(isHidden: false, userGroup: "GMs", user: [User(name: "Rogers"), User(name: "Mathew"), User(name: "Sean")]),
            Users(isHidden: false, userGroup: "Managers", user: [User(name: "Hans"), User(name: "Lee"), User(name: "Nora"), User(name: "Veenu")]),
            Users(isHidden: false, userGroup: "Supervisors", user: [User(name: "Sam"), User(name: "Saheed"), User(name: "Adam")])
        ]
    }
}

extension CollapsibleTableVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let isHidden = users[section].isHidden
        if isHidden {
            return 0
        }
        return users[section].user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = users[indexPath.section].user[indexPath.row].name
        return cell!
    }
}

extension CollapsibleTableVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        view.backgroundColor = .systemPurple
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 30))
        button.setTitle(users[section].userGroup, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.tag = section
        button.addTarget(self, action: #selector(collapseToggle(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        return view
    }
}

extension CollapsibleTableVC {
    @objc func collapseToggle(_ sender: UIButton) {
        var selectedGroup = users[sender.tag]
        selectedGroup.isHidden = !selectedGroup.isHidden
        users[sender.tag] = selectedGroup
        
        tableView.reloadData()
    }
}
