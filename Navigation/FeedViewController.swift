//
//  NewslineViewController.swift
//  Navigation
//
//  Created by Maksim Kargin on 12.02.2022.
//

import UIKit

struct Post {
    let title: String
}

let post = Post(title: "Post")

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.spacing = 10
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            stackView.backgroundColor = .systemGray2
            return stackView
        } ()
        view.addSubview(stackView)
        
        [
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ]
            .forEach {$0.isActive = true}
        
        let postButtonOne: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 50))
            button.setTitle("Post One", for: .normal)
            button.backgroundColor = .white
            button.layer.cornerRadius = 4
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            return button
        } ()
        
        stackView.addArrangedSubview(postButtonOne)
        
        let postButtonTwo: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 50))
            button.setTitle("Post Two", for: .normal)
            button.backgroundColor = .white
            button.layer.cornerRadius = 4
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            return button
        } ()
        
        stackView.addArrangedSubview(postButtonTwo)
    }
    
    @objc func tap() {
            let post = PostViewController()
            navigationController?.pushViewController(post, animated: true)
    }
}
