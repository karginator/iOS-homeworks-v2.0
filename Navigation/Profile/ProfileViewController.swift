//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Maksim Kargin on 12.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var isLogin = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        
        let profileHeaderView = ProfileHeaderView()
        self.view.addSubview(profileHeaderView)
        profileHeaderView.profileHeaderViewConstraintFunc()
    }
    
    override func viewWillLayoutSubviews() {
        if isLogin {
            isLogin = !isLogin
            navigationController?.pushViewController(LogInViewController(), animated: true)
        }
    }
}
