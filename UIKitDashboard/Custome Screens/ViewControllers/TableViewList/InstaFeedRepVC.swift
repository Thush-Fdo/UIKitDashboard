//
//  InstaFeedRepVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 26/06/2024.
//

import UIKit

class InstaFeedRepVC: UIViewController {
    
    var tableView = UITableView(frame: .zero, style: .plain)
    private var postList: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Insta Feed Replica"
        postList = fetchData()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.register(InstaPostCell.self, forCellReuseIdentifier: InstaPostCell.postCellID)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.pinToEdges(of: view)
    }
}

extension InstaFeedRepVC {
    func fetchData() -> [Post] {
        return [
            Post(name: "Helen Kellar",
                 avatarImg: Images.avatarHelen,
                 location: "",
                 isVerified: true,
                 postImage: Images.helenPost,
                 caption: "The African lion (Panthera leo) is a majestic and iconic species found primarily in Sub-Saharan Africa. Known for their powerful build and regal mane, lions are apex predators that play a crucial role in their ecosystems. They live in social groups called prides, which typically consist of several related females, their offspring, and a few adult males. Male lions are distinguished by their impressive manes, which can vary in color from blonde to black and are used to intimidate rivals and attract mates.",
                 likes: 124,
                 time: "4 hours ago"),
            
            Post(name: "Shania Twain",
                 avatarImg: Images.avatarShania,
                 location: "Musgrave Park, Cork",
                 isVerified: true,
                 postImage: Images.shaniaPost,
                 caption: "The luxury view of an infinity pool seamlessly blends with the horizon, creating an illusion of endless water. Surrounded by opulent amenities and lush landscapes, this exquisite setting offers a tranquil escape, inviting guests to indulge in unparalleled relaxation and breathtaking scenic beauty.",
                 likes: 16425,
                 time: "5 hours ago"),
            
            Post(name: "Coin Master Official",
                 avatarImg: Images.avatarCoin,
                 location: "Sponsered",
                 isVerified: false,
                 postImage: Images.coinPost,
                 caption: "In the heart of nature, a lively water stream dances over rocks and weaves through lush greenery, creating a serene melody. The vibrant ecosystem thrives, with flora and fauna harmoniously coexisting in this tranquil paradise.",
                 likes: 692413,
                 time: "9 hours ago"),
            
            Post(name: "Tony Jaa",
                 avatarImg: Images.avatarTony,
                 location: "Ella, Sri Lanka",
                 isVerified: true,
                 postImage: Images.tonyPost,
                 caption: "Indonesian country life is vibrant and serene, marked by lush rice paddies, traditional villages, local markets, friendly communities, and a deep connection to nature.",
                 likes: 124,
                 time: "1 day ago")
        ]
    }
}

extension InstaFeedRepVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InstaPostCell.postCellID) as! InstaPostCell
        let post = postList[indexPath.row]
        cell.set(post: post)
        return cell
    }
}

