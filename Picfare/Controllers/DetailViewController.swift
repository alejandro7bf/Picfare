//
//  DetailViewController.swift
//  Picfare
//
//  Created by Alejandro on 1/21/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import UIKit
import WebKit
class DetailViewController: UIViewController, WKNavigationDelegate {

    var movie = Movie()
  
    let URL_PREFIX = "https://image.tmdb.org/t/p/w200/"
    @IBOutlet weak var Titlelabel: UILabel!
    @IBOutlet weak var Overviewtext: UITextView!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var video: WKWebView!
 
    @IBOutlet weak var Activity: UIActivityIndicatorView!
    
    @IBOutlet weak var Star1: UIButton!
    @IBOutlet weak var Star2: UIButton!
    @IBOutlet weak var Star3: UIButton!
    @IBOutlet weak var Star4: UIButton!
    @IBOutlet weak var Star5: UIButton!
    lazy var stars: [UIButton] = [Star1, Star2, Star3, Star4, Star5]

    @IBOutlet weak var releasedate: UILabel!
    @IBOutlet weak var VoteCount: UILabel!
    let color = #colorLiteral(red: 0.1089653285, green: 0.1162077975, blue: 0.1277524541, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Activity indicator
        self.Activity.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        video.navigationDelegate = self
        self.video.addSubview(self.Activity)
        self.Activity.startAnimating()
       
        //Call the functions that shows the info.
        show_video()
        show_stars()
        show_data()
    
        //UI Design
          self.video.backgroundColor = color
          self.view.backgroundColor = color
          self.Overviewtext.backgroundColor = color
        
          self.Overviewtext.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
          self.Titlelabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          self.VoteCount.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          self.releasedate.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

    }
    
    
    // bar status white
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    
    //Stops the activity indicator
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      self.Activity.stopAnimating()
    }
    
    
    
    
    
    //Shows the data in the labels, ect.
    func show_data(){
        //Best way to deal with optional values and avoid a crash displaying data.
        if let movietitle = movie.title{
            Titlelabel.text = movietitle
        }
        if let overview = movie.overview{
            Overviewtext.text = overview
        }
        if let votecount = movie.vote_count{
            VoteCount.text = "(" + String(votecount) + ")"
        }
        if let release = movie.release_date{
            releasedate.text = "Release date: " + release
        }
        if let posterpath = movie.poster_path{
            let urlimage = NSURL(string: URL_PREFIX + posterpath)! as URL
            Image.load_image(url: urlimage)
        }
  
        }
    
    
    
    
    //Shows the video from youtube.
    func show_video(){
        movie.load_video { (response) in
            if !(response.isEmpty) {
                let URLvideo: URL = NSURL(string: "https://www.youtube.com/embed/" + response )! as URL
                let myrequest = URLRequest(url: URLvideo)
                self.video.load(myrequest)
            }
        }
    }
    
    
    
    
    
    //Shows the stars
    func show_stars(){
        //Avoiding nil values.
        if let voteaverage = movie.vote_average{
       
        let number = voteaverage/2
        let Decimalpart: Double = number - Double(Int(number))
        
        let index: Int = Int(number)
        var i = 0
        while i < index {
            //Show a full star until i + 1 = index when it depends on the number could be an empty star (<=0.3) half star ( >0.3 & <0.8) and full star (>0.8)
            stars[i].setImage(UIImage(named: "ImageFull"), for: UIControl.State.normal)
            if i + 1 == index {
                if Decimalpart > 0.3 && Decimalpart < 0.8{
                    stars[i + 1].setImage(UIImage(named: "StarHalf"), for: UIControl.State.normal)
                }else if Decimalpart >= 0.8 {
                    stars[i+1].setImage(UIImage(named: "ImageFull"), for: UIControl.State.normal)
                }
                }
                i = i + 1
            }
        }
    }

    
    

    

}
