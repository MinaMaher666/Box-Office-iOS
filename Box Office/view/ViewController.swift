//
//  ViewController.swift
//  Box Office
//
//  Created by Mina Maher on 3/8/18.
//  Copyright © 2018 Mina R3V. All rights reserved.
//

import UIKit
import ImageLoader

class ViewController: UIViewController {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie] = []
    var clickedMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if collectionView != nil {
            collectionView.dataSource = self
            collectionView.delegate = self
            getData()
        }
    }
    
    
    func getData() {
        self.showActivityIndicator()
        
        var url: String!
        switch self.title {
        case "Up Coming"?:
            url = NetworkUtils.getMoviesUrl(path: Constants.API_UPCOMING_URL)
        default:
            url = NetworkUtils.getMoviesUrl(path: Constants.API_LATEST_URL)
        }
        
        NetworkUtils.getMovies(url: url) {
            (apiMovies, error) in
            self.hideActivityIndicator()
            if let error = error as String!{
                print("Error: \(error)")
            } else if let apiMovies = apiMovies{
                self.movies = apiMovies
                self.collectionView.reloadData()
            }
        }
    }
    
    func showActivityIndicator () {
    }
    
    func hideActivityIndicator () {
        print("Hide loading indicator")
        if loadingIndicator != nil {
            loadingIndicator.isHidden = true
        } else {
            print("Loading indicator is NULL!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let vc = segue.destination as! DetailsViewController
            vc.movie = clickedMovie
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell
        
        cell.configure(movie: movies[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath)
        
        clickedMovie = movies[indexPath.row]
        
        performSegue(withIdentifier: "details", sender: cell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width/2)-1, height: collectionView.bounds.height/2)
    }
}

class CustomCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    
    func configure (movie: Movie) {
        image.load.request(with: NetworkUtils.getMoviesPoster(path: movie.posterPath))
        
        lblMovieName.text = movie.title
    }
}
