//
//  Movie.swift
//  Saxlshi Lecture18
//
//  Created by Giorgi Goginashvili on 1/13/23.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Codable {
    let name: String?
    let posterImage: String?
    let votes: Double?
    let overview: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "original_title"
        case posterImage = "poster_path"
        case votes = "vote_average"
        case overview = "overview"
    }
}
