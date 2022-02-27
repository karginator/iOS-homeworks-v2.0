//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Maksim Kargin on 20.02.2022.
//

import UIKit

//public extension UIView {
//
//    func toAutoLayout() {
//        translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    func addSubviews(_ subviews: UIView...) {
//        subviews.forEach { addSubview($0) }
//    }
//
//}

class ProfileHeaderView: UIView {
    
    var userFoto: UIImageView = {
        let userFoto = UIImageView(image: UIImage(named: "lenin"))
        userFoto.translatesAutoresizingMaskIntoConstraints = false
        userFoto.layer.cornerRadius = 50
        userFoto.layer.borderWidth = 3
        userFoto.clipsToBounds = true
        userFoto.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return userFoto
    } ()
    
    var userName: UILabel = {
       let userName = UILabel()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.text = "Vladimir Lenin"
        userName.textColor = .black
        userName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return userName
    } ()
    
    var userStatus: UILabel = {
        let userStatus = UILabel()
        userStatus.translatesAutoresizingMaskIntoConstraints = false
        userStatus.text = "Waiting for something..."
        userStatus.textColor = .gray
        userStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return userStatus
    } ()
    
    var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.setTitle("Set status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.backgroundColor = .blue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shadowRadius = 4
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return statusButton
    } ()
    
    var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.placeholder = "Waiting for something..."
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusTextField
    } ()
    
    private var statusText: String = {
        let statusText = ""
        return statusText
    } ()
    
    init() {
        super.init(frame: CGRect())
        self.addSubview(userFoto)
        self.addSubview(userName)
        self.addSubview(userStatus)
        self.addSubview(statusButton)
        self.addSubview(statusTextField)
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
            userStatus.bottomAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30),
            
            statusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusButton.topAnchor.constraint(equalTo: userFoto.bottomAnchor, constant: 16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusTextField.leftAnchor.constraint(equalTo: userFoto.rightAnchor, constant: 20),
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            statusTextField.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func buttonPressed() {
        userStatus.text = statusText
        if let textUserStatus = userStatus.text {
            print(textUserStatus)
        }
    }
        
    @objc func statusTextChanged(_ textField: UITextField) {
        if let statusTextOpt = statusTextField.text {
            statusText = statusTextOpt
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}
