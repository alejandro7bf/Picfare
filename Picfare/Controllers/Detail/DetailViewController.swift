//
//  DetailViewController.swift
//  Picfare
//
//  Created by Alejandro on 1/21/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import UIKit
import WebKit
class DetailViewController: UIViewController {

    var movie = Movie()
  
    let URL_PREFIX = "https://image.tmdb.org/t/p/w200/"
   
    @IBOutlet weak var Titlelabel: UILabel!
    @IBOutlet weak var Overviewlabel: UILabel!
    
    @IBOutlet weak var Popularitysection: UILabel!
    @IBOutlet weak var Languagelabel: UILabel!
    
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var video: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movie.load_video { (response) in
            
            let URLvideo: URL = NSURL(string: "https://www.youtube.com/embed/" + response )! as URL
            let myrequest = URLRequest(url: URLvideo)
            self.video.load(myrequest)
          
       }
     
        Titlelabel.text = movie.title!
        Overviewlabel.text = movie.overview!
        Overviewlabel.sizeToFit()
        Popularitysection.text = String(format:"%",movie.vote_average!)
        Languagelabel.text =  ( movie.original_language! ).uppercased()
        let urlimage = NSURL(string: URL_PREFIX + movie.poster_path!)! as URL
        Image.load_image(url: urlimage)
        
    
        
        

    }
    

    

}
