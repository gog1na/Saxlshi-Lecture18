//
//  MoviesViewController.swift
//  Saxlshi Lecture18
//
//  Created by Giorgi Goginashvili on 1/13/23.
//

import UIKit

class MoviesViewController: UIViewController {
    
    var movieApiManager: MovieAPIManagerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMovies()
    }
    
    func fetchMovies() {
        movieApiManager = MovieAPIManager()
        
        movieApiManager?.fetchMoview(with: .popular, completion: { result in
            switch result {
            case .success(let movieResponse):
                print(movieResponse.movies)
            case .failure(let error):
                print(error)
            }
        })
    }


}

