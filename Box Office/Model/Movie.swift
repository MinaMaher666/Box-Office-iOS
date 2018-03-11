//
//  Movie.swift
//  Box Office
//
//  Created by Mina Maher on 3/9/18.
//  Copyright © 2018 Mina R3V. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie {
    var posterPath: String
    var title: String
    var releaseDate: String
    var overview: String
    init (json: JSON) {
        title = json["title"].string!
        posterPath = json["poster_path"].string!
        releaseDate = json["release_date"].string!
        overview = json["overview"].string!
    }
}
