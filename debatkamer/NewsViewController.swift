//
//  NewsViewController.swift
//  debatkamer
//
//  Created by Fhict on 08/06/2017.
//  Copyright © 2017 Ruud Slagers. All rights reserved.
//

import UIKit
import FeedKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let url = URL(string: "http://images.apple.com/main/rss/hotnews/hotnews.rss")!
    var news = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        feedParsing()
        showFeedParse()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let count = 1
        /*FeedParser(URL: url)?.parse({ (result) in
            
            guard let feed = result.rssFeed, result.isSuccess else {
                print(result.error!)
                return
            }
            
            count = (feed.items?.count)!
            
        })*/
        return count
    }
    
    func feedParsing()
    {
        FeedParser(URL: url)?.parse({ (result) in
            result.rssFeed // An `RSSFeed` model
        })
        
        FeedParser(URL: url)?.parse({ (result) in
            
            switch result {
            case .rss(let rssFeed):
                print(rssFeed) // An `RSSFeed` model
            case .atom(let atomFeed):
                print(atomFeed) // An `AtomFeed` model
            case .failure(let error):
                print(error) // An `NSError` object
            }
            
        })
        
        
    }
    
    func showFeedParse()
    {
        FeedParser(URL: url)?.parse({ (result) in
            
            guard let feed = result.rssFeed, result.isSuccess else {
                print(result.error!)
                return
            }
            
            print(feed.title)                      // The feed's `Title`
            print(feed.items?.count)               // The number of articles
            print(feed.items?.first?.title)        // The feed's first article `Title`
            print(feed.items?.first?.description)  // The feed's first article `Description`
            print(feed.items?.first?.pubDate)      // The feed's first article `Publication Date`
            
        })
  
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        cell.newsImage.image = UIImage(named: "CDA.png")
        cell.newsTitle.text = ""
        return cell
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
