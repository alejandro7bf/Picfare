//
//  API.swift
//  Picfare
//
//  Created by Alejandro on 1/19/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API: UIViewController {

    var TopRate = [Movie()]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlTopRated = "https://api.themoviedb.org/3/movie/top_rated?api_key=aff8de1ea0379ead48969bbdd9ce5460&language=en-US&page=1"
        
       //let urlUpcoming= "https://api.themoviedb.org/3/movie/upcoming?api_key=aff8de1ea0379ead48969bbdd9ce5460&language=en-US"
        
       // let urlPopular = "https://api.themoviedb.org/3/movie/upcoming?api_key=aff8de1ea0379ead48969bbdd9ce5460&language=en-US"
        
        
        //Alamofire función para la petición get
        Alamofire.request(urlTopRated, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)

                // Se itera sobre el json results para crear cada objeto y añadirlo al array
                for (_,object) in json["results"]  {
                    let Mov = Movie()
                    Mov.id = object["id"].rawValue as? Int
                    Mov.title = object["title"].rawValue as? String
                    Mov.overview = object["overview"].rawValue as? String
                    Mov.original_language = object["original_language"].rawValue as? String
                    Mov.original_title = object["original_title"].rawValue as? String
                    Mov.popularity = object["popularity"].rawValue as? Double
                    Mov.poster_path = object["poster_path"].rawValue as? String
                    Mov.vote_count = object["vote_count"].rawValue as? Int
                    Mov.vote_average = object["vote_average"].rawValue as? Double
                    Mov.release_date = object["release_date"].rawValue as? Date
                    
                    self.TopRate.append(Mov)
                }
                print(self.TopRate.count)
            case .failure(let error):
                print(error)
            }
        }
        
        
      
    
    
    }

}
