//
//  parlementVotingBehaviorVC.swift
//  debatkamer
//
//  Created by Fhict on 02/06/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit

class parlementVotingBehaviorVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let partijen = ["VVD": ["33", "Voor"], "GroenLinks": ["14", "Voor"], "PVV": ["20", "Voor"], "Partij Voor De Dieren": ["5", "Voor"], "ChristenUnie": ["5", "Voor"], "D66": ["19", "Voor"], "CDA": ["19", "Voor"], "SP": ["14", "Voor"], "50plus": ["4", "Voor"], "DENK": ["3", "Tegen"], "Forum Voor Democratie": ["2", "Tegen"]]
    
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return partijen.count
    }
    
    
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ParlementTableViewCell
        
        tableView.allowsSelection = false
        
        let newPartijen = [String](partijen.keys)
        let zetelArray =  [[String]](partijen.values)
        let voorTegen = [[String]](partijen.values)
        
        
        
        cell.myImage.image = UIImage(named: newPartijen[indexPath.row] + ".jpg")
        cell.voteLabel.text = voorTegen[indexPath.row][1]
        cell.zetelLabel.text = zetelArray[indexPath.row][0] + " zetels"
        cell.partyName.text = newPartijen[indexPath.row]
        
        if voorTegen[indexPath.row][1] == "Voor" {
            cell.backgroundColor = UIColor.green.withAlphaComponent(0.05)
        }
        else
        {
            cell.backgroundColor = UIColor.red.withAlphaComponent(0.05)
        }
        
        
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
