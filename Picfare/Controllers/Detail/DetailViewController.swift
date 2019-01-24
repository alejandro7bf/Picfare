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
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.Activity.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        
        
        video.navigationDelegate = self
        
        self.video.addSubview(self.Activity)
        self.Activity.startAnimating()
       
      
        
        movie.load_video { (response) in
            if !(response.isEmpty) {
            let URLvideo: URL = NSURL(string: "https://www.youtube.com/embed/" + response )! as URL
            let myrequest = URLRequest(url: URLvideo)
            self.video.load(myrequest)
           
            }
        
     
       }
        
      
     
        Titlelabel.text = movie.title!
        Overviewtext.text = movie.overview!
        
     
        let urlimage = NSURL(string: URL_PREFIX + movie.poster_path!)! as URL
        Image.load_image(url: urlimage)
        
    
        
        

    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      self.Activity.stopAnimating()
    }
    
    
    

    

}
