//
//  JSONUtils.swift
//  Box Office
//
//  Created by Mina Maher on 3/9/18.
//  Copyright © 2018 Mina R3V. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONUtils {
    private init (){
    }
    
    static func getMovies (data: Data) -> [Movie]?{
        let json = try? JSON(data)
        if let json = json {
            let movies = (json["results"].array.map({ (json) -> [Movie] in
                var movies: [Movie] = []
                for movieJson in json {
                    movies.append(Movie(json: movieJson))
                }
                return movies
//                return Movie(json: json)
            }))
            return movies
        } else {
            return nil
        }
    }
}
