//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Maksim Kargin on 12.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let postButton = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 50))
        postButton.setTitle("post", for: .normal)
        postButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(postButton)
        

    }
    
    @objc func tap() {
        let post = PostViewController()
        navigationController?.pushViewController(post, animated: true)
        
    }

}
