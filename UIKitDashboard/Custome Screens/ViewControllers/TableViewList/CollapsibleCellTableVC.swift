//
//  CollapsibleCellTableVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 29/06/2024.
//

import UIKit

class CollapsibleCellTableVC: UIViewController {
    
    private var tableView = UITableView(frame: .zero, style: .plain)
    private var wonders: [Wonder] = []
    
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        assignData()
        navigationItem.title = "Eight Wonders"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //        tableView.pinToEdges(of: view)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.backgroundColor = .systemBackground
        
        tableView.register(WonderCell.self, forCellReuseIdentifier: WonderCell.WonderCellID)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension CollapsibleCellTableVC {
    func assignData() {
        wonders = [
            Wonder(name: "Giza Pyramids", image: Images.gizawonder),
            Wonder(name: "Great Wall of China", image: Images.greatwallwonder),
            Wonder(name: "Colosseum", image: Images.colosseumwonder),
            Wonder(name: "Petra", image: Images.petrawonder),
            Wonder(name: "Chichén Itzá", image: Images.chichenitzawonder),
            Wonder(name: "Machu Picchu", image: Images.machupicchuwonder),
            Wonder(name: "Taj Mahal", image: Images.tajmahalwonder),
            Wonder(name: "Christ the Redeemer", image: Images.christtheredeemerwonder)
        ]
    }
}

extension CollapsibleCellTableVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wonders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WonderCell.WonderCellID)  as! WonderCell
        cell.set(wonder: wonders[indexPath.row])
        cell.selectionStyle = .none
        cell.animate()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        tableView.beginUpdates()
        tableView.reloadRows(at: [selectedIndex], with: .none)
        tableView.endUpdates()
    }
}

extension CollapsibleCellTableVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndex == indexPath {
            return 300
        } else {
            return 45
        }
    }
}


