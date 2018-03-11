//
//  DetailsViewController.swift
//  Box Office
//
//  Created by Mina Maher on 3/10/18.
//  Copyright © 2018 Mina R3V. All rights reserved.
//

import UIKit

class DetailsViewController: ViewController {
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var txtDetails: UITextView!
    @IBOutlet weak var lblReleaseDate: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            lblMovieTitle.text = movie.title
            imgPoster.load.request(with: NetworkUtils.getMoviesPoster(path: movie.posterPath))
            txtDetails.text = movie.overview
            lblReleaseDate.text = movie.releaseDate
        }
    }
}
