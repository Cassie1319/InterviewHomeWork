//
//  LoginViewController.swift
//  WhatAnApp
//
//  Created by Cassie on 2024/10/15.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var pswTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

private extension LoginViewController {
    
    @IBAction func clickLoginButton() {
        print("xxxxx")
        let uploadStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let tabbarVC = uploadStoryboard.instantiateViewController(withIdentifier: "TAB") as? UITabBarController {
            self.present(tabbarVC, animated: true)
        }
    }
    
}

