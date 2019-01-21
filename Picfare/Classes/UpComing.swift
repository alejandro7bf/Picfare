//
//  Upcoming.swift
//  Picfare
//
//  Created by Alejandro on 1/20/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import Foundation

class UpComing: Movie {

    override var path: String {
        return "https://api.themoviedb.org/3/movie/upcoming?api_key=aff8de1ea0379ead48969bbdd9ce5460&language=en-US&page=1"
    }
    
}
