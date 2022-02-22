//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Maksim Kargin on 20.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var userFoto: UIImageView
    var userName: UILabel
    var userStatus: UILabel
    var statusButton: UIButton
    
    init() {
        
        userFoto = UIImageView(image: UIImage(named: "lenin"))
        userName = UILabel()
        userStatus = UILabel()
        statusButton = UIButton()
        super.init(frame: CGRect())
        
        userFoto.translatesAutoresizingMaskIntoConstraints = false
        userFoto.layer.cornerRadius = 50
        userFoto.layer.borderWidth = 3
        userFoto.clipsToBounds = true
        userFoto.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        self.addSubview(userFoto)
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.text = "Vladimir Lenin"
        userName.textColor = .black
        userName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.addSubview(userName)
        
        userStatus.translatesAutoresizingMaskIntoConstraints = false
        userStatus.text = "Waiting for something..."
        userStatus.textColor = .gray
        userStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.addSubview(userStatus)
        
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.backgroundColor = .blue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shadowRadius = 4
        statusButton.addTarget(self, action: #selector(pressStatusButton), for: .touchUpInside)

        self.addSubview(statusButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: superview!.leftAnchor),
            self.rightAnchor.constraint(equalTo: superview!.rightAnchor),
            self.topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor),
            self.heightAnchor.constraint(equalToConstant: 220),
            
            userFoto.widthAnchor.constraint(equalToConstant: 100),
            userFoto.heightAnchor.constraint(equalTo: userFoto.widthAnchor),
            userFoto.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            userFoto.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            
            userName.leftAnchor.constraint(equalTo: userFoto.rightAnchor, constant: 20),
            userName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            userName.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            
            userStatus.leftAnchor.constraint(equalTo: userFoto.rightAnchor, constant: 20),
            userStatus.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            userStatus.bottomAnchor.constraint(equalTo: userName.bottomAnchor, constant: 50),
            
            statusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusButton.topAnchor.constraint(equalTo: userFoto.bottomAnchor, constant: 16),
            statusButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    @objc func pressStatusButton() {
        print(userStatus.text!)
    }
}
