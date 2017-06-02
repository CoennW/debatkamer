//
//  VotePageVC.swift
//  debatkamer
//
//  Created by Fhict on 19/05/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper
import FirebaseDatabase

class VotePageVC: UIViewController {

    @IBOutlet weak var textViewMotie: UITextView!
    var ref: DatabaseReference?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ref = Database.database().reference()
        
        
        
        super.viewDidLoad()
        textViewMotie.layer.cornerRadius = 5
        textViewMotie.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        textViewMotie.layer.borderWidth = 0.5
        textViewMotie.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    @IBAction func agreeButtonTapped(_ sender: Any) {
        
        
        
        //huidig aantal stemmen ophalen
        ref?.child("stelling").observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            let totalVotes = snapshot.childSnapshot(forPath: "eens").value as! String
            print(totalVotes)
            
            var newTotalVotes = Int(totalVotes)!
            newTotalVotes = newTotalVotes + 1
            let newStringTotalVotes = String(describing: newTotalVotes)
            
            
            //Naar firebase schrijven
            self.ref?.child("stelling").child("eens").setValue("\(newStringTotalVotes)")
            
        })
        
        
        
    }
    
    @IBAction func disagreeButtonTapped(_ sender: Any) {
        
        ///huidig aantal stemmen ophalen
        ref?.child("stelling").observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            let totalVotes = snapshot.childSnapshot(forPath: "oneens").value as! String
            print(totalVotes)
            
            var newTotalVotes = Int(totalVotes)!
            newTotalVotes = newTotalVotes + 1
            let newStringTotalVotes = String(describing: newTotalVotes)
            
            
            //Naar firebase schrijven
            self.ref?.child("stelling").child("oneens").setValue("\(newStringTotalVotes)")
            
        })
        
    }
    

    @IBAction func signOutTapped(_ sender: Any) {
        
        let keychainResult = KeychainWrapper.standard.remove(key: KEY_UID)
        print("ADMIN: ID verwijderd van keychain \(keychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "GoToSignIn", sender: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
