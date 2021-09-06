//
//  Repositoty.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation
import RxSwift

protocol MovieRepositoryProtocol {
    
    func fetchingListMovie(_ pageNumber: Int) -> Observable<[MovieModel]>
    
    func searchMovie(_ searchText: String) -> Observable<[MovieModel]>
}


class MoviesRepository: MovieRepositoryProtocol {
   
    private let datasource = MovieDatasource()
    
    func fetchingListMovie(_ pageNumber: Int) -> Observable<[MovieModel]> {
        return datasource.fetchingListMovie(pageNumber)
    }
    
    func searchMovie(_ searchText: String) -> Observable<[MovieModel]> {
        return datasource.searchMovie(searchText)
    }
    

}
