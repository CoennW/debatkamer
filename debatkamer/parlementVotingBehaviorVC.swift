//
//  parlementVotingBehaviorVC.swift
//  debatkamer
//
//  Created by Fhict on 02/06/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit

class parlementVotingBehaviorVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let partyImages = ["VVD"]
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return partyImages.count
    }
    
    
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ParlementTableViewCell
        
        cell.myImage.image = UIImage(named: partyImages[indexPath.row] + ".jpg")
        cell.voteLabel.text = partyImages[indexPath.row]
        
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
