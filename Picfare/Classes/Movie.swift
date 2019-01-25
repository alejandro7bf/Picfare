//
//  Movies.swift
//  Picfare
//
//  Created by Alejandro on 1/20/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import Foundation
import SwiftyJSON
class Movie {
    
    // Declare all the variables of the MOVIE.
    var id, vote_count: Int?
    var title, overview, poster_path, original_language, original_title, release_date: String?
    var popularity, vote_average: Double?
 
    var path: String  {
        return ""
    }
    

    //Results from the API to the variables.
func load_data(completion: @escaping (Array<Movie>) -> Void ) {
        var List: [Movie] = []
         let Connection = API()
    
    Connection.DataRequest(urlpath: self.path) { (response) in
        
        for (_,object) in response  {
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
            Mov.release_date = object["release_date"].rawValue as? String
            
            List.append(Mov)

        }
         completion(List)
        }
  
    }
    
    //load video
    func load_video(completion: @escaping (String) -> Void ) {
        //var videokey: String = ""
        let Connection = API()

        let url: String = "https://api.themoviedb.org/3/movie/" + String(describing: self.id!) + "/videos?api_key=aff8de1ea0379ead48969bbdd9ce5460&language=en-US"
      
        Connection.DataRequest(urlpath: url) { (response) in
            
            if let videokey = response[0]["key"].rawValue as? String {
                completion(videokey)
            }else{
                print("the video was not found")
            }
          
        }
        
    }
    
    
    
    
    
    
}
