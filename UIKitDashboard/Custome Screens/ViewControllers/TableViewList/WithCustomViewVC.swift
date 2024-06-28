//
//  WithCustomViewVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 26/06/2024.
//

import UIKit

class WithCustomViewVC: UIViewController {
    
    var tableView = UITableView(frame: .zero, style: .plain)
    private var videoList: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "With CustomView"
        videoList = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.rowHeight = 100
        
        tableView.register(VideoCell.self, forCellReuseIdentifier: VideoCell.VideocellID)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.pinToEdges(of: view)
    }
}

extension WithCustomViewVC {
    func fetchData() -> [Video] {
        return [
            Video(image: Images.youtubetemp, title: "Youtube Temp"),
            Video(image: Images.themostattractive, title: "The Most Attractive and this title should give more than two lines in the view"),
            Video(image: Images.headshotkills, title: "Head Shot Kill"),
            Video(image: Images.youtube, title: "Youtube"),
            Video(image: Images.lionwilderness, title: "Lion wilderness"),
            Video(image: Images.growyourbusiness, title: "Grow Your Business with this long title"),
            Video(image: Images.earnrevenue, title: "Earn Revenue"),
            Video(image: Images.yourdreambody, title: "Your Dream Body"),
            Video(image: Images.sermontitle, title: "Sermon Title")
        ]
    }
}

extension WithCustomViewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoCell.VideocellID) as! VideoCell
        let video = videoList[indexPath.row]
        cell.set(video: video)
        return cell
    }
}
