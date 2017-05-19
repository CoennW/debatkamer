//
//  LoginVC.swift
//  debatkamer
//
//  Created by Ruud Slagers on 12/05/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text, let pwd = pwdField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("ADMIN: Email gebruiker maakt connectie met Firebase")
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("ADMIN: Kan geen connectie maken met Firebase")
                        } else {
                            print("ADMIN: Succesvol verbinding gemaakt met Firebase")
                        }
                    })
                }
            })
        }
    }
}
