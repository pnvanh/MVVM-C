//
//  MovieViewModel.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation
import RxSwift
import RxCocoa

struct MovieViewModel: ViewModel {
    
    var pageNumber = 1
    var useCase: MovieUseCaseLogic!
    
    struct Input {
        let loadStrigger: Driver<Int>
    }
    
    struct Output {
        let movie: Driver<[MovieModel]>
    }
    
    func transform(_ input: Input) -> Output {
        let input = useCase.fetchingListMovie(pageNumber)
        return Output(movie: input.asDriver(onErrorJustReturn: []))
    }
    
}
