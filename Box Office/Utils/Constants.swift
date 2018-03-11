//
//  Constants.swift
//  Box Office
//
//  Created by Mina Maher on 3/9/18.
//  Copyright © 2018 Mina R3V. All rights reserved.
//

import Foundation

class Constants {
    private init () {
    }
    
    static let API_KEY = "0c32cce056404719ff7861467c5cb00b"
    
    static let API_BASE_URL = "https://api.themoviedb.org/3/"
    static let API_IMAGES_BASE_URL = "https://image.tmdb.org/t/p/w500/"
    static let API_LATEST_URL = "movie/now_playing"
    static let API_UPCOMING_URL = "movie/popular"
    static let API_TOP_RATED_URL = "movie/top_rated"
    static let PARAM_API_KEY = "api_key"
    static let PARAM_LANGUAGE = "language"
    static let PARAM_ENGLISH_US = "en-US"
    
}
