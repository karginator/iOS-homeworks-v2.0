//
//  PostViewController.swift
//  Navigation
//
//  Created by Maksim Kargin on 13.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        self.title = post.title
        
        let infoBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(tap))
        navigationItem.rightBarButtonItem = infoBarButtonItem
    }
    
    @objc func tap() {
        let infoBBI = InfoViewController()
    }
}
