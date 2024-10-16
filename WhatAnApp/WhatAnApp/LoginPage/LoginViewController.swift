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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pswTextField.text = ""
    }

}

private extension LoginViewController {
    
    @IBAction func clickLoginButton() {
        
        if let name = nameTextField.text, let psw = pswTextField.text {
            if name == "Leona", psw == "1234" {
                let uploadStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                if let tabbarVC = uploadStoryboard.instantiateViewController(withIdentifier: "TAB") as? UITabBarController {
                    self.navigationController?.pushViewController(tabbarVC, animated: true)
                }
            } else {
                self.showAlert()
            }
        } else {
            self.showAlert()
        }
    }
    
}

