//
//  PostViewController.swift
//  Navigation
//
//  Created by Maksim Kargin on 13.02.2022.
//

import UIKit

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

let postArray: [Post] = [
    Post(author: "authorOne", description: "descriptionOne", image: "image_one", likes: 1, views: 10),
    Post(author: "authorTwo", description: "descriptionTwo", image: "image_two", likes: 2, views: 20),
    Post(author: "authorThree", description: "descriptionThree", image: "image_three", likes: 3, views: 30),
    Post(author: "authorFour", description: "descriptionFour", image: "image_four", likes: 4, views: 40)
]

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        self.title = postTitle.title
        
        let infoBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(tap))
        navigationItem.rightBarButtonItem = infoBarButtonItem
    }
    
    @objc func tap() {
        let infoBBI = InfoViewController()
        self.present(infoBBI, animated: true, completion: nil)
    }
}
