//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Maksim Kargin on 12.02.2022.
//

import UIKit

public extension UIView {
    
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

class ProfileViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        
        let profileHeaderView = ProfileHeaderView()
        self.view.addSubview(profileHeaderView)
        profileHeaderView.profileHeaderViewConstraintFunc()
    }
    
    override func viewWillLayoutSubviews() {
        self.view.subviews.first?.frame = self.view.frame
    }
}
