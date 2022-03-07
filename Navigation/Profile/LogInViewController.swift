//
//  LogInViewController.swift
//  Navigation
//
//  Created by Maksim Kargin on 04.03.2022.
//

import UIKit

extension UIImage {
    
    func imageWithAlpha(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    var contentView: UIView = {
        let contentView = UIView()
        contentView.toAutoLayout()
        contentView.backgroundColor = .white
        return contentView
    }()
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.toAutoLayout()
        return imageView
    }()
    
    var userNameTextField: UITextField = {
       let textField = UITextField()
        textField.toAutoLayout()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 0.25
        textField.placeholder = "Email or phone"
        textField.keyboardType = .default
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.returnKeyType = .done
        return textField
    }()
    
    var passwordTextFiald: UITextField = {
        let textField = UITextField()
        textField.toAutoLayout()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 0.25
        textField.placeholder = "Password"
        textField.keyboardType = .default
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.returnKeyType = .default
        textField.isSecureTextEntry = true
        return textField
    }()
    
    var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.toAutoLayout()
        logInButton.setTitle("Log In", for: .normal)
        
        if let bluePixelImage = UIImage(named: "blue_pixel") {
            logInButton.setBackgroundImage(bluePixelImage.imageWithAlpha(alpha: 1), for: .normal)
            logInButton.setBackgroundImage(bluePixelImage.imageWithAlpha(alpha: 0.8), for: .selected)
            logInButton.setBackgroundImage(bluePixelImage.imageWithAlpha(alpha: 0.8), for: .highlighted)
            logInButton.setBackgroundImage(bluePixelImage.imageWithAlpha(alpha: 0.8), for: .disabled)
        }
        
        logInButton.imageView?.contentMode = .scaleAspectFill
        logInButton.titleLabel?.textColor = .white
        logInButton.layer.cornerRadius = 10
        logInButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        logInButton.clipsToBounds = true
        return logInButton
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.backgroundColor = .systemGray6
        stackView.axis = .vertical
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 10
        stackView.distribution = .fillProportionally
        stackView.clipsToBounds = true
        return stackView
    }()
    
    func logInViewConstraintFunc() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            logInButton.topAnchor.constraint(equalTo: passwordTextFiald.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        scrollView.contentSize = CGSize(width: view.frame.width, height: max(view.frame.width, view.frame.height))
        contentView.addSubviews(logoImageView, stackView, logInButton)
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(passwordTextFiald)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGR))
        view.addGestureRecognizer(tapGestureRecognizer)
        self.logInViewConstraintFunc()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func logIn() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapGR() {
        userNameTextField.resignFirstResponder()
        passwordTextFiald.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardRectangle = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardRectangle.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardRectangle.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}
