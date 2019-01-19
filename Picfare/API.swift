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

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = " https://api.themoviedb.org/3/movie/top_rated?api_key=aff8de1ea0379ead48969bbdd9ce5460&language=en-US&page=1"
        
        
        Alamofire.request(urlString).response { response in // method defaults to `.get`
            debugPrint(response)
        }
        
        
        
        
        Alamofire.request(urlString, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for movie in json{
                    
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
        
        
    
    
    }

}
