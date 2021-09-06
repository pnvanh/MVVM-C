//
//  MovieLogic.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation
import RxSwift

//MARK: - Business Logic
protocol MovieUseCaseLogic {
    var repository: MovieRepositoryProtocol { get set }
    func fetchingListMovie(_ pageNumber: Int) -> Observable<[MovieModel]>
    func searchMovie(_ searchText: String) -> Observable<[MovieModel]>
}

// MARK: - Coordinator Logic
protocol MoviesCoordinatorLogic: Coordinator {
    func goToMovieDetailsScreen(_ movie: MovieModel)
}
