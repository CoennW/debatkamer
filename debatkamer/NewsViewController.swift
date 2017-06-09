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
    var titleToPass = ""
    var dateToPass = ""
    var descriptonToPass = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        feedParsing()
        showFeedParse()
        self.title = "Nieuws"
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        var count = 0
        FeedParser(URL: url)?.parse({ (result) in
            
            guard let feed = result.rssFeed, result.isSuccess else {
                print(result.error!)
                return
            }
            
            count = (feed.items?.count)!
            
        })
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
            
            print(feed.title ?? String())                     // The feed's `Title`
            print(feed.items?.count ?? Int())               // The number of articles
            print(feed.items?.first?.title ?? String())        // The feed's first article `Title`
            print(feed.items?.first?.description ?? String())  // The feed's first article `Description`
            print(feed.items?.first?.pubDate ?? String())      // The feed's first article `Publication Date`
            
        })
  
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        
        
        FeedParser(URL: url)?.parse({ (result) in
            
            guard let feed = result.rssFeed, result.isSuccess else {
                print(result.error!)
                return
            }
            //let imageUrlString = "https://images.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png"
           
            /*DispatchQueue.global().async {
                let imageUrl:URL = URL(string: imageUrlString)!
                let imageData:NSData = NSData(contentsOf: imageUrl)!
                //UIImage(data: (caminhodaImagem as! NSData) as Data)
                DispatchQueue.main.async {
                    let image = UIImage(data: imageData as Data)
                    cell.newsImage.image = image
                }
                
            }*/
            let randomNumber = String(arc4random_uniform(6) + 1)
            cell.newsImage.image = UIImage(named: "image" + randomNumber + ".jpg")
            
            let df = DateFormatter()
            df.dateFormat = "dd/MM/yyyy HH:mm"
            let date = df.string(from: (feed.items?[indexPath.row].pubDate)!)
            
            cell.newsTitle.text = (feed.items?[indexPath.row].title)
            cell.newsDate.text = date
            
        })

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newsDetailViewController = segue.destination as! newsDetailViewController
        newsDetailViewController.newsTitleString = titleToPass
        newsDetailViewController.newsDateString = dateToPass
        FeedParser(URL: url)?.parse({ (result) in
            
            guard let feed = result.rssFeed, result.isSuccess else {
                print(result.error!)
                return
            }
            
            
            self.descriptonToPass = (feed.items?.first?.description ?? String())  // The feed's first article `Description`
           
            
        })
        newsDetailViewController.newsTextString = self.descriptonToPass
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        let currentCell = tableView.cellForRow(at: indexPath)! as! NewsTableViewCell
        titleToPass = currentCell.newsTitle.text!
        dateToPass = currentCell.newsDate.text!
        
        
        
        performSegue(withIdentifier: "news", sender: self)
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
