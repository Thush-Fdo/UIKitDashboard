//
//  CollapsibleTableHeaderVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 29/06/2024.
//

import UIKit

class CollapsibleTableHeaderVC: UIViewController{
    
    private var tableView = UITableView(frame: .zero, style: .plain)
    private let cellID = "CellID"
    private var genres: [Genre] = []
    
    var selectedIndePath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        assignData()
        navigationItem.title = "Movies List"
        
        selectedIndePath = IndexPath(row: -1, section: -1)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.backgroundColor = .systemBackground
        
        tableView.register(UIKDExpandableHeaderView.self, forHeaderFooterViewReuseIdentifier: UIKDExpandableHeaderView.cellID)
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

extension CollapsibleTableHeaderVC {
    func assignData() {
        genres = [
            Genre(name: "Action",
                  movies: [
                    "Casino Royale (2006)",
                    "Commando (1985)",
                    "Iron Man (2008)",
                    "X-Men: Days of Future Past (2014)"
                  ],
                  expanded: false,
                  subtitle: "Please select a movie"),
            
            
            Genre(name: "Comedy",
                  movies: [
                    "Very Bad Things (1998)",
                    "Fargo (2006)",
                    "Sleepless in Seattle (1993)",
                    "How to Lose a Guy in 10 Days (2003)",
                    "Planes, Trains, and Automobiles (1987)",
                    "Dumb and Dumber (1994)"
                  ],
                  expanded: false,
                  subtitle: "Please select a movie"),
            
            
            Genre(name: "Horror",
                  movies: [
                    "The Frighteners (1996)",
                    "The Others (2001)",
                    "The Babadook (2014)",
                    "Pumpkinhead (1988)"
                  ],
                  expanded: false,
                  subtitle: "Please select a movie"),
        ]
    }
}

extension CollapsibleTableHeaderVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres[section].movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = genres[indexPath.section].movies[indexPath.row]
        cell?.accessoryType = (indexPath == selectedIndePath)  ? .checkmark : .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndePath = indexPath
        self.genres[indexPath.section].subtitle = tableView.cellForRow(at: indexPath)?.textLabel?.text ?? "N/A"
        genres[indexPath.section].expanded = !genres[indexPath.section].expanded
        tableView.beginUpdates()
        tableView.reloadSections([indexPath.section], with: .automatic)
        tableView.endUpdates()
    }
}

extension CollapsibleTableHeaderVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if genres[indexPath.section].expanded {
            return 45
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: UIKDExpandableHeaderView.cellID) as! UIKDExpandableHeaderView
        
        headerView.customInit(title: genres[section].name,
                              subtitle: genres[section].subtitle,
                              section: section,
                              delegate: self)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

extension CollapsibleTableHeaderVC: UIKDExpandableHeaderViewDelegate{
    func toggleSection(header: UIKDExpandableHeaderView, section: Int) {
        genres[section].expanded = !genres[section].expanded
        tableView.beginUpdates()
        tableView.reloadSections([section], with: .automatic)
        tableView.endUpdates()
    }
}
