//
//  MovieModel.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation
import ObjectMapper


struct MovieModel {
    var adult: Bool
    var backdropPath: String
    var genreIDS: [Int]
    var id: Int
    var originalLanguage, originalTitle, overview: String
    var popularity: Double
    var posterPath: String
    var releaseDate, title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int
}

extension MovieModel: Mappable {
    init?(map: Map) {
        adult = false
        backdropPath = ""
        genreIDS = []
        id = 0
        originalLanguage = ""
        originalTitle = ""
        overview = ""
        popularity = 0
        posterPath = ""
        releaseDate = ""
        title = ""
        video = false
        voteAverage = 0
        voteCount = 0
    }
    
    mutating func mapping(map: Map) {
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        genreIDS <- map["genre_ids"]
        id <- map["id"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        releaseDate <- map["release_date"]
        title <- map["title"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]
    }
    
    
}
