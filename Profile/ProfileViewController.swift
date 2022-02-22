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
        let profileHeaderView = ProfileHeaderView()
        self.view.addSubview(profileHeaderView)
    }
    override func viewWillLayoutSubviews() {
        self.view.subviews.first?.frame = self.view.frame
    }
}
