//
//  SearchMovieViewModel.swift
//  MVVM-C
//
//  Created by Viet Anh on 06/09/2021.
//

import Foundation
import RxSwift
import RxCocoa

struct SearchMovieViewModel: ViewModel {
    
    var useCase: SearchUseCaseLogic!
    
    struct Input {
        let search: Driver<String>
    }
    
    struct Output {
        let movie: Driver<[MovieModel]>
    }

    func transform(_ input: Input) -> Output {
        let movie = input
            .search
            .flatMapLatest { query -> Driver<[MovieModel]> in
                return self.useCase.searchMovie(query).asDriver(onErrorJustReturn: [])
        }
        return Output(movie: movie.asDriver(onErrorJustReturn: []))
    }
    


}
