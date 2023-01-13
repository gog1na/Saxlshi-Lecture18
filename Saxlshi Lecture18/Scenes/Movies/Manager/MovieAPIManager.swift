//
//  MovieAPIManager.swift
//  Saxlshi Lecture18
//
//  Created by Giorgi Goginashvili on 1/13/23.
//

import Foundation

/*
 https://api.themoviedb.org/3/movie/upcoming?api_key=b05b465c55ad91f6a57956826ab95df9
                                             api_key=b05b465c55ad91f6a57956826ab95df9
 https://api.themoviedb.org/3/movie/top_rated?api_key=b05b465c55ad91f6a57956826ab95df9
 https://api.themoviedb.org/3/movie/popular?api_key=b05b465c55ad91f6a57956826ab95df9
 
 https://api.themoviedb.org/3/movie/550?api_key=b05b465c55ad91f6a57956826ab95df9
 */

enum MovieCategory: Int {
    case upcoming = 0
    case topRated
    case popular
    
    var queryParam: String {
        switch self {
        case .upcoming:
            return "upcoming"
        case .topRated:
            return "top_rated"
        case .popular:
            return "popular"
        }
    }
}

protocol MovieAPIManagerProtocol {
    func fetchMoview(with category: MovieCategory, completion: @escaping (Result<MovieResponse, Error>)->())
}

class MovieAPIManager: MovieAPIManagerProtocol {
    func fetchMoview(with category: MovieCategory, completion: @escaping (Result<MovieResponse, Error>) -> ()) {
        let  urlString = "https://api.themoviedb.org/3/movie/\(category.queryParam)?api_key=b05b465c55ad91f6a57956826ab95df9"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {return}
            do {
                let decodedData = try JSONDecoder().decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

