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

    

    
    
    
    @IBOutlet weak var agreeBoxHeight: NSLayoutConstraint!
    
    @IBOutlet weak var disagreeBoxHeight: NSLayoutConstraint!
   
    @IBOutlet weak var eensBlock: UIImageView!
    
   
    @IBOutlet weak var agreeBox: UIView!
    
    @IBOutlet weak var textViewMotie: UITextView!
    @IBOutlet weak var agreeLabel: UILabel!
    @IBOutlet weak var disagreeLabel: UILabel!
    var ref: DatabaseReference?
    var aantalEens = 0
    var aantalOneens = 0
    var timer = Timer()
    var writeToLabel = "0"
    var isTimerRunning = false
    
    var i = 0
    
    
    override func viewWillAppear(_ animated: Bool) {
        agreeBoxHeight.constant -= 208
        disagreeBoxHeight.constant -= 208
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewMotie.layer.cornerRadius = 5
        textViewMotie.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        textViewMotie.layer.borderWidth = 0.5
        textViewMotie.clipsToBounds = true
        
        runAddVotes()
        //animateVotes()
        
        
        

        
        
        

        
        
        //agreeBox.frame.size.height = 500
        
        
        /*UIView.animate(withDuration: 1) {
            
            self.agreeBox.frame.size.height += 200
            self.disagreeBox.frame.size.height += 100
            
            
        }*/
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func animateVotes() {
        
        //animatie voor aantal eens
        UIView.animate(withDuration: 4, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            
            //self.eensBlock.frame = CGRect(x: self.eensBlock.frame.origin.x, y: self.view.frame.maxY, width: 0, height: self.eensBlock.frame.height + 100)
            //var totalHeight = 208
            //var totalVotes = self.aantalEens! + self.aantalOneens!
            //self.eensBlock.transform = CGAffineTransform(scaleX: 1, y: CGFloat(heightAantalEens))
            
            //Total Votes ophalen
            
            
            let percentageEens = self.aantalEens/208 * 100
            let percentageOneens = self.aantalOneens/208 * 100
            
            //let PercentageBalkEens = Double(percentageEens) * 2.08
            //let PercentageBalkOneens = Double(percentageOneens) * 2.08
            
            self.agreeBoxHeight.constant += 208
            self.view.layoutIfNeeded()
            
            
        }, completion: nil)
        
    }
    
    func runAddVotes() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self,   selector: (#selector(votingBehaviorVC.addVotes)), userInfo: nil, repeats: true)
    }

    
    func addVotes() {
    
        //stemgegevens naar label schrijven
        ref = Database.database().reference()
        
        ref?.child("stelling").observeSingleEvent(of: .value, with: { (snapshot) in
            
            self.aantalEens = Int((snapshot.childSnapshot(forPath: "eens").value as? String)!)!
            self.aantalOneens = Int((snapshot.childSnapshot(forPath: "oneens").value as? String)!)!
            
            if self.i < self.aantalEens
            {
                
                    self.agreeLabel.text = self.writeToLabel
                    self.writeToLabel = String(Int(self.writeToLabel)! + 1)
                if self.i < self.aantalOneens {
                    self.disagreeLabel.text = self.writeToLabel
                    
                }
                
                
                self.i += 1
            }
            else
            {
                self.timer.invalidate()
            }
            if self.i < 2 {
                
                UIView.animate(withDuration: 2.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    
                    
                    //self.eensBlock.frame = CGRect(x: self.eensBlock.frame.origin.x, y: self.view.frame.maxY, width: 0, height: self.eensBlock.frame.height + 100)
                    //var totalHeight = 208
                    //var totalVotes = self.aantalEens! + self.aantalOneens!
                    //self.eensBlock.transform = CGAffineTransform(scaleX: 1, y: CGFloat(heightAantalEens))
                    
                    //Total Votes ophalen
                    
                    let totalVotes:Double = Double(self.aantalEens + self.aantalOneens)
                    let percentageEens:Double = Double(self.aantalEens)/totalVotes * Double(100)
                    let percentageOneens:Double = Double(self.aantalOneens)/totalVotes * Double(100)
                    
                    let percentageBalkEens:Double = Double(208)/Double(100) * Double(percentageEens)
                    let percentageBalkOneens:Double = Double(208)/Double(100) * Double(percentageOneens)
                    
                    self.agreeBoxHeight.constant += CGFloat(percentageBalkEens)
                    self.disagreeBoxHeight.constant += CGFloat(percentageBalkOneens)
                    self.view.layoutIfNeeded()
                    
                    
                }, completion: nil)
                
            }
            
            
            //self.agreeLabel.text = snapshot.childSnapshot(forPath: "eens").value as? String
            //self.disagreeLabel.text = snapshot.childSnapshot(forPath: "oneens").value as? String
            
            //self.aantalEens = snapshot.childSnapshot(forPath: "eens").value as? String
            //self.aantalOneens = snapshot.childSnapshot(forPath: "oneens").value as? String
            
            
            
            
        })
    
    }

    @IBAction func urlButton(_ sender: Any) {
        
        openURL(urlStr: "https://debatkamer.nl/forum/discussion/17/appdiscussie-meer-of-minder-gaswinning-in-groningen")
        
    }
    
    func openURL(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }

        
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
