//
//  NetworkUtils.swift
//  Box Office
//
//  Created by Mina Maher on 3/8/18.
//  Copyright © 2018 Mina R3V. All rights reserved.
//

import Foundation
import Alamofire

class NetworkUtils {
    
    static func getMoviesUrl (path: String) -> String {
        return Constants.API_BASE_URL + path
    }
    
    static func getMovies (url: String, complition: @escaping ([Movie]?, String?) -> ()) {
        var params: Parameters = [:]
        params[Constants.PARAM_API_KEY] = Constants.API_KEY
        params[Constants.PARAM_LANGUAGE] = Constants.PARAM_ENGLISH_US
        
        print("URL: \(url)\nParams: \(params)")
        
        Alamofire.request(url, parameters: params).responseString {
            response in
            if let error = response.error {
                complition(nil, error.localizedDescription)
            } else if let data = response.data {
                let movies: [Movie] = JSONUtils.getMovies(data: data)!
                complition(movies, nil)
            }
        }
    }
    
    static func getMoviesPoster (path: String) -> String {
        return Constants.API_IMAGES_BASE_URL + path
    }
}
