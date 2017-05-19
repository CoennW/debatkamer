//
//  VotePageVC.swift
//  debatkamer
//
//  Created by Fhict on 19/05/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit

class VotePageVC: UIViewController {

    @IBOutlet weak var textViewMotie: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        textViewMotie.layer.cornerRadius = 5
        textViewMotie.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        textViewMotie.layer.borderWidth = 0.5
        textViewMotie.clipsToBounds = true

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
