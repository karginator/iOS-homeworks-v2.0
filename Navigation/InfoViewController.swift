//
//  InfoViewController.swift
//  Navigation
//
//  Created by Maksim Kargin on 13.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let buttonForAlert = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 50))
        buttonForAlert.setTitle("Alert", for: .normal)
        buttonForAlert.setTitleColor(.systemGray, for: .normal)
        buttonForAlert.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(buttonForAlert)
    }
    
    @objc func tap() {
        let alertVC = UIAlertController(title: "ALERT", message: "It's ALERT", preferredStyle: .alert)
        let actionOne = UIAlertAction(title: "Action One", style: .default) {_ in print("Action One")}
        alertVC.addAction(actionOne)
        let actionTwo = UIAlertAction(title: "Action Two", style: .default) {_ in print("Action Two")}
        alertVC.addAction(actionTwo)
        self.present(alertVC, animated: true, completion: nil)

    }
}
