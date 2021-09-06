//
//  MovieDatasource.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation
import RxSwift

class MovieDatasource: Datasource {
    
    func fetchingListMovie(_ pageNumber: Int) -> Observable<[MovieModel]> {
        let input = FetchingMoviesInput(pageNumber)
        return APIService.shared.fetchingListMovie(input).map {  output -> [MovieModel] in
            if let movie = output.movies {
               return movie
           }
           throw APIResponseError.invalidResponseData
        }
    }
    
    func searchMovie(_ searchText: String) -> Observable<[MovieModel]> {
        let input =  SearchMoviesInput(searchText)
        return APIService.shared.searchMovie(input).map {  output -> [MovieModel] in
            if let movie = output.movies {
               return movie
           }
           throw APIResponseError.invalidResponseData
        }
    }
    
}
