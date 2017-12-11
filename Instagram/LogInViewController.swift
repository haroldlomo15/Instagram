//
//  ViewController.swift
//  Instagram
//
//  Created by Harold  on 12/8/17.
//  Copyright © 2017 Harold . All rights reserved.
//

import UIKit
import Parse
class LogInViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInDidTapped(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user:PFUser?, error) in
            if user != nil {
                print("you logged in")
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
            }
        }
        
    }
    
    
    @IBAction func signUpDidTapped(_ sender: Any) {
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text 
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
                // manually segue to logged in view
            }
        }
        
    }
    
    
}

