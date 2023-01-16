//
//  MoviesViewController.swift
//  Saxlshi Lecture18
//
//  Created by Giorgi Goginashvili on 1/13/23.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieApiManager: MovieAPIManagerProtocol?
    var upcomingMovies: [Movie] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    var topRatedMovies: [Movie] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var popularMovies: [Movie] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMovies()
        setupTableView()
    }
    
    private func fetchMovies() {
        movieApiManager = MovieAPIManager()
        
        movieApiManager?.fetchMoview(with: .popular, completion: { result in
            switch result {
            case .success(let movieResponse):
                self.upcomingMovies = movieResponse.movies
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        movieApiManager?.fetchMoview(with: .topRated, completion: { result in
            switch result {
            case .success(let movieResponse):
                self.topRatedMovies = movieResponse.movies
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        movieApiManager?.fetchMoview(with: .popular, completion: { result in
            switch result {
            case .success(let movieResponse):
                self.popularMovies = movieResponse.movies
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.backgroundColor =  UIColor.black
        
        tableView.register(UINib(nibName: "UpcomingTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "UpcomingTableViewCell")
        tableView.register(UINib(nibName: "TopRatedTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "TopRatedTableViewCell")
        tableView.register(UINib(nibName: "PopularTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "PopularTableViewCell")
    }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingTableViewCell", for: indexPath) as! UpcomingTableViewCell
            cell.movies = upcomingMovies
            return cell
        } else if  indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopRatedTableViewCell", for: indexPath) as! TopRatedTableViewCell
            cell.movies = topRatedMovies
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTableViewCell", for: indexPath) as! PopularTableViewCell
        cell.movies = popularMovies
        return cell
    }
}



