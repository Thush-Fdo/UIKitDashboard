//
//  UpdateTableCellVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 01/07/2024.
//

import UIKit

class UpdateTableCellVC: UIViewController {
    
    private var tableView = UITableView()
    private var cellID = "NameTableCellID"
    private var nameLabelList: [String] = []
    private var updateText:  UITextField!
    var selectedIndex = IndexPath(item: -1, section: -1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabelList = getNameList()
        configureTableView()
        congfigureTextUpdateNavItems()
        setupNavigationBarWithTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeBackButton()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.pinToEdges(of: view)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func congfigureTextUpdateNavItems() {
        let updateButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(updateButtonTapped))
        navigationItem.rightBarButtonItem = updateButton
    }
    
    @objc func updateButtonTapped() {
        if let cell = tableView.cellForRow(at: selectedIndex) {
            
            var cellContext = cell.defaultContentConfiguration()
            cellContext.text = updateText.text
            cell.contentConfiguration = cellContext
        }
    }
    
    func customizeBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "backbtn"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        // Moves the custom backButton slightly to the left so it's in the same spot where back navigation typically is.
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .clear
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -20, bottom: 0, trailing: 0)
        backButton.configuration = configuration
        
        let backView = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        backView.addSubview(backButton)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backView)
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupNavigationBarWithTextField() {
        updateText = UITextField(frame: CGRect(x: 80, y: 0, width: 250, height: 30))
        
        updateText.placeholder = "Update text here"
        updateText.font = UIFont.systemFont(ofSize: 15)
        updateText.borderStyle = UITextField.BorderStyle.roundedRect
        updateText.autocorrectionType = UITextAutocorrectionType.no
        updateText.keyboardType = UIKeyboardType.default
        updateText.returnKeyType = UIReturnKeyType.done
        updateText.clearButtonMode = UITextField.ViewMode.whileEditing
        updateText.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            
        updateText.backgroundColor = .clear
        
        updateText.addTarget(self, action: #selector(updateTextEditDone(_:)), for: UIControl.Event.primaryActionTriggered)
        self.navigationItem.titleView = updateText
    }
    
    @objc func updateTextEditDone(_ sender: UITextField) {
        if let cell = tableView.cellForRow(at: selectedIndex) {
            
            var cellContext = cell.defaultContentConfiguration()
            cellContext.text = updateText.text
            cell.contentConfiguration = cellContext
        }
    }
}

extension UpdateTableCellVC {
    
    func getNameList() -> [String] {
        return [
            "Name 1",
            "Name 2",
            "Name 3",
            "Name 4",
            "Name 5",
            "Name 6",
            "Name 7",
            "Name 8"
        ]
    }
}

extension UpdateTableCellVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameLabelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) else {
            return UITableViewCell()
        }
        
        var cellContext = cell.defaultContentConfiguration()
        cellContext.text = nameLabelList[indexPath.row]
        cell.contentConfiguration = cellContext
        
        return cell
    }
    
}


extension UpdateTableCellVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        self.updateText.text = nameLabelList[indexPath.row]
    }
}
