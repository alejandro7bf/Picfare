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
    lazy var stars: [UIButton] = [Star1,Star2,Star3,Star4,Star5]

    @IBOutlet weak var VoteCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        self.Activity.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        video.navigationDelegate = self
        self.video.addSubview(self.Activity)
        self.Activity.startAnimating()
        load_video()

        
        load_stars()
        
 
        Titlelabel.text = movie.title!
        Overviewtext.text = movie.overview!
        let urlimage = NSURL(string: URL_PREFIX + movie.poster_path!)! as URL
        Image.load_image(url: urlimage)
    

    }
    
    
    
    
    func load_video(){
        movie.load_video { (response) in
            if !(response.isEmpty) {
                let URLvideo: URL = NSURL(string: "https://www.youtube.com/embed/" + response )! as URL
                let myrequest = URLRequest(url: URLvideo)
                self.video.load(myrequest)
            }
        }
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      self.Activity.stopAnimating()
    }
    
    
    
    func load_stars(){
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
