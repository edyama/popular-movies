//
//  PopularMoviesData.swift
//  PopularMoviesApp
//
//  Created by Eduardo Yamagata Motta on 06/04/22.
//

import Foundation

struct PopularMoviesData: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let poster_path: String?
    let overview: String
    let release_date: String
    let title: String
}
