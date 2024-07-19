//
//  SegmentedTableViewVC.swift
//  UIKitDashboard
//
//  Created by Shermin Fernando on 19/07/2024.
//

import UIKit

class SegmentedTableViewVC: UIViewController {
    
    var tableView = UITableView(frame: .zero, style: .plain)
    private var mainTabs: [String] = ["Movies", "Songs", "Stories"]
    private let cellID = "CellID"
    
    var selectedtopMenuIndex = 0
    
    var topMenu : UISegmentedControl!
    
    private var Movies: [String] = [
        "The Shawshank Redemption (1994) - Drama",
        "The Godfather (1972) - Crime, Drama",
        "Inception (2010) - Sci-Fi, Thriller",
        " Fiction (1994) - Crime, Drama",
        "The Dark Knight (2008) - Action, Crime, Drama",
        "Forrest Gump (1994) - Drama, Romance",
        "The Matrix (1999) - Sci-Fi, Action",
        "Fight Club (1999) - Drama",
        "The Lord of the Rings: The Fellowship of the Ring (2001) - Fantasy, Adventure",
        "Schindler's List (1993) - Biography, Drama, History"
    ]
    
    private var Songs: [String] = [
        "Echoes of Eternity",
        "Midnight Reverie",
        "Crimson Skies",
        "Whispering Pines",
        "Neon Dreams",
        "Sapphire Horizons",
        "Golden Serenade",
        "Velvet Moonlight"
    ]
    
    private var Books: [String] = [
        "The Very Hungry Caterpillar by Eric Carle",
        "Charlotte's Web by E.B. White",
        "Harry Potter and the Sorcerer's Stone by J.K. Rowling",
        "Where the Wild Things Are by Maurice Sendak",
        "The Chronicles of Narnia: The Lion, the Witch and the Wardrobe by C.S. Lewis"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Segmented TableView"
        view.backgroundColor = .systemBackground
        
        setUpSegmentedControl()
        configureTableView()
    }
    
    func setUpSegmentedControl() {
        topMenu = UISegmentedControl(items: mainTabs)
        topMenu.selectedSegmentIndex = 0
        selectedtopMenuIndex = 0
        
        topMenu.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        view.addSubview(topMenu)
        
        topMenu.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topMenu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            topMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topMenu.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.backgroundColor = .systemBackground
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topMenu.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            selectedtopMenuIndex = 0
        case 1:
            selectedtopMenuIndex = 1
        case 2:
            selectedtopMenuIndex = 2
        default:
            selectedtopMenuIndex = 0
        }
        
        tableView.reloadData()
    }
}

extension SegmentedTableViewVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedtopMenuIndex == 0 {
            return Movies.count
        } else if selectedtopMenuIndex == 1 {
            return Songs.count
        } else {
            return Books.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) else {
            return UITableViewCell()
        }
        
        var cellContext = cell.defaultContentConfiguration()
        
        if selectedtopMenuIndex == 0 {
            cellContext.text = Movies[indexPath.row]
        } else if selectedtopMenuIndex == 1 {
            cellContext.text = Songs[indexPath.row]
        } else {
            cellContext.text = Books[indexPath.row]
        }
        
        cell.contentConfiguration = cellContext
        
        return cell
    }
}

extension SegmentedTableViewVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

