//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Maksim Kargin on 12.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var isLogin = true
    
    var postTableView: UITableView = {
        let tableView = UITableView()
        tableView.toAutoLayout()
        tableView.refreshControl = UIRefreshControl()
        tableView.isScrollEnabled = true
        tableView.separatorInset = .zero
        tableView.estimatedSectionHeaderHeight = 220
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.refreshControl?.addTarget(self, action: #selector(reloadPost), for: .valueChanged)
        return tableView
    }()
    
    var varPostArray = postArray

    func profileViewConstraintFunc() {
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            postTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        
        postTableView.delegate = self
        postTableView.dataSource = self
        
        postTableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifire)
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifire)
        
        view.addSubview(postTableView)
        
        profileViewConstraintFunc()
    }
    
    override func viewWillLayoutSubviews() {
        if isLogin {
            isLogin = false
            navigationController?.pushViewController(LogInViewController(), animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc func reloadPost() {
        postTableView.reloadData()
        postTableView.refreshControl?.endRefreshing()
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.varPostArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifire) as! ProfileHeaderView
            return headerView
        } else { return nil }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifire, for: indexPath) as! PostTableViewCell
        cell.specifyFields(post: varPostArray[indexPath.row])
        return cell
    }
}
