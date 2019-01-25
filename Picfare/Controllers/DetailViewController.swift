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
    var stars: [UIButton] = []

    @IBOutlet weak var releasedate: UILabel!
    @IBOutlet weak var VoteCount: UILabel!
    let color = #colorLiteral(red: 0.0709286711, green: 0.07564300278, blue: 0.08315775233, alpha: 1)
    
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
    
    
    
    
    //Stops the activity indicator
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      self.Activity.stopAnimating()
    }
    
    
    
    
    
    //Shows the data in the labels, ect.
    func show_data(){
        Titlelabel.text = movie.title!
        Overviewtext.text = movie.overview!
        releasedate.text = "Release date: " + movie.release_date!
        let urlimage = NSURL(string: URL_PREFIX + movie.poster_path!)! as URL
        Image.load_image(url: urlimage)
        
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
        stars.append(Star1)
        stars.append(Star2)
        stars.append(Star3)
        stars.append(Star4)
        stars.append(Star5)
        let number: Double = movie.vote_average!/2
        let Decimalpart: Double = number - Double(Int(number))
        VoteCount.text = "(" + String(movie.vote_count!) + ")"

        let index: Int = Int(number)
        var i = 0
        while i < index {
            
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
