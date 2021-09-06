//
//  SearchUseCase.swift
//  MVVM-C
//
//  Created by Viet Anh on 06/09/2021.
//

import Foundation
import RxSwift

struct SearchUseCase: SearchUseCaseLogic {
   
    var repository: MovieRepositoryProtocol
    
    func searchMovie(_ searchText: String) -> Observable<[MovieModel]> {
        return repository.searchMovie(searchText)
    }
    
    
}
