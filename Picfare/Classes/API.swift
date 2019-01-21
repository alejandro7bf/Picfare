//
//  API.swift
//  Picfare
//
//  Created by Alejandro on 1/19/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class API {

    
    func DataRequest(urlpath: String , completion: @escaping (JSON) -> Void ) {
        print(urlpath)
        //Alamofire función para la petición get
        Alamofire.request(urlpath, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                //Devuelve el json 'results'
                completion(JSON(value)["results"])
                
            case .failure(let error):
                print(error)
        }
            
       
        
    }
    
    
    }
}
