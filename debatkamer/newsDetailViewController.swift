//
//  newsDetailViewController.swift
//  debatkamer
//
//  Created by Fhict on 08/06/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit

class newsDetailViewController: UIViewController {

    @IBOutlet weak var newsText: UITextView!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    var newsTextString = String()
    var newsDateString = String()
    var newsTitleString = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        fillView()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fillView() {
        newsText.text = newsTextString
        newsDate.text = newsDateString
        newsTitle.text = newsTitleString
        newsImage.backgroundColor = UIColor.lightGray
        let randomNumber = String(arc4random_uniform(6) + 1)
        newsImage.image = UIImage(named: "image" + randomNumber + ".jpg")
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
