//
//  DetailViewController.swift
//  Picfare
//
//  Created by Alejandro on 1/21/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var movie = Movie()
  
    let URL_PREFIX = "https://image.tmdb.org/t/p/w200/"
   
    @IBOutlet weak var Titlelabel: UILabel!
    @IBOutlet weak var Overviewlabel: UILabel!
    
    @IBOutlet weak var Popularitysection: UILabel!
    @IBOutlet weak var Languagelabel: UILabel!
    
    @IBOutlet weak var Image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   

         
        Titlelabel.text = movie.title!
        Overviewlabel.text = movie.overview!
        Overviewlabel.sizeToFit()
        Popularitysection.text = String(format:"%f",movie.popularity!)
        Languagelabel.text = movie.original_language!
        
        Image.load_image(url: NSURL(string: URL_PREFIX + movie.poster_path!)! as URL )
        
        
    }
    

    

}
