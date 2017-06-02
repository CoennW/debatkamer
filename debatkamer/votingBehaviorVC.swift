//
//  votingBehaviorVC.swift
//  debatkamer
//
//  Created by Fhict on 01/06/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class votingBehaviorVC: UIViewController {

    @IBOutlet weak var agreeBox: UIView!
    @IBOutlet weak var disagreeBox: UIView!
    @IBOutlet weak var agreeLabel: UILabel!
    @IBOutlet weak var disagreeLabel: UILabel!
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //stemgegevens naar label schrijven
        ref = Database.database().reference()
        
        ref?.child("stelling").observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            self.agreeLabel.text = snapshot.childSnapshot(forPath: "eens").value as? String
            self.disagreeLabel.text = snapshot.childSnapshot(forPath: "oneens").value as? String
            
            
        })

        
        
        
        
        //agreeBox.frame.size.height = 500
        
        
        /*UIView.animate(withDuration: 1) {
            
            self.agreeBox.frame.size.height += 200
            self.disagreeBox.frame.size.height += 100
            
            
        }*/
        
        
        
        
        
        // Do any additional setup after loading the view.
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
