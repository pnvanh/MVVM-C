//
//  SearchLogic.swift
//  MVVM-C
//
//  Created by Viet Anh on 06/09/2021.
//

import Foundation
import RxSwift

//MARK: - Business Logic
protocol SearchUseCaseLogic {
    var repository: MovieRepositoryProtocol { get set }
    func searchMovie(_ searchText: String) -> Observable<[MovieModel]>
}

// MARK: - Coordinator Logic
protocol SearchCoordinatorLogic: Coordinator {
    func goToMovieDetailsScreen(_ movie: MovieModel)
}
