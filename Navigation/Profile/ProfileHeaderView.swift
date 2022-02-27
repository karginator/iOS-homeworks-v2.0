//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Maksim Kargin on 20.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var titleeee = ""
    
    var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "lenin"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        imageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return imageView
    } ()
    
    var fullNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vladimir Lenin"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    } ()
    
    var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    } ()
    
    var setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.05408742279, green: 0.4763534069, blue: 0.9996182323, alpha: 1)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    } ()
    
    var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.placeholder = "Waiting for something..."
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    } ()
    
    private var statusText: String = {
        let statusText = ""
        return statusText
    } ()
    
    var titleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set title", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.05408742279, green: 0.4763534069, blue: 0.9996182323, alpha: 1)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(setTitle), for: .touchUpInside)
        return button
    } ()
    
    init() {
        super.init(frame: CGRect())
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(setStatusButton)
        self.addSubview(statusTextField)
        self.addSubview(titleButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
        if let textUserStatus = statusLabel.text {
            print(textUserStatus)
        }
        statusTextField.text = ""
    }
        
    @objc func statusTextChanged(_ textField: UITextField) {
        if let statusTextOpt = statusTextField.text {
            statusText = statusTextOpt
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    func profileHeaderViewConstraintFunc() {
    
        self.translatesAutoresizingMaskIntoConstraints = false
        
        guard let letSuperView = superview else { return }
        
        self.leftAnchor.constraint(equalTo: letSuperView.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: letSuperView.rightAnchor).isActive = true
        self.topAnchor.constraint(equalTo: letSuperView.safeAreaLayoutGuide.topAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        
        fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20).isActive = true
        fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27).isActive = true
        fullNameLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16).isActive = true
        
        statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20).isActive = true
        statusLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16).isActive = true
        statusLabel.bottomAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 30).isActive = true
        
        setStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        setStatusButton.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16).isActive = true
        setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16).isActive = true
        setStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        statusTextField.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20).isActive = true
        statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10).isActive = true
        statusTextField.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16).isActive = true
        statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        titleButton.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleButton.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor).isActive = true
        titleButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 520).isActive = true
        titleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func setTitle() {
        titleeee = fullNameLabel.text!
        print("new title \(titleeee)")
    }
}


