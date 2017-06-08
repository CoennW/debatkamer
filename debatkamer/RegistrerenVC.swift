//
//  RegistrerenVC.swift
//  debatkamer
//
//  Created by Ruud Slagers on 08/06/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class RegistrerenVC: UIViewController {
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            print("ID gevonden in keychain")
            performSegue(withIdentifier: "GoToStemmen", sender: nil)
        }
    }
    
    
    
    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text, let pwd = pwdField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("ADMIN: Email gebruiker maakt connectie met Firebase1")
                    if let user = user {
                        self.completeSignIn(id: user.uid)
                    }
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("ADMIN: Kan geen connectie maken met Firebase2")
                        } else {
                            print("ADMIN: Succesvol verbinding gemaakt met Firebase")
                            if let user = user {
                                self.completeSignIn(id: user.uid)
                            }
                        }
                    })
                }
            })
        }
    }
    func completeSignIn(id: String) {
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("ADMIN: Data opgeslagen aan de Keychain \(keychainResult)")
        performSegue(withIdentifier: "GoToStemmen", sender: nil)
    }
    
}

