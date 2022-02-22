//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Maksim Kargin on 20.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var userFoto: UIImageView
    
    init() {
        
        userFoto = UIImageView(image: UIImage(named: "lenin"))
        super.init(frame: CGRect())
        
        userFoto.translatesAutoresizingMaskIntoConstraints = false
        userFoto.layer.cornerRadius = 50
        userFoto.layer.borderWidth = 3
        userFoto.clipsToBounds = true
        userFoto.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        self.addSubview(userFoto)
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
            userFoto.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)
            ])
    }
}
