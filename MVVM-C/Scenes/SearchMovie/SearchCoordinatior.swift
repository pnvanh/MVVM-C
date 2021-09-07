//
//  SearchCoordinatior.swift
//  MVVM-C
//
//  Created by Viet Anh on 06/09/2021.
//

import Foundation
import UIKit

class SearchCoordinator: SearchCoordinatorLogic {
    
    weak var navigationController: UINavigationController?
 
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
  
    func start() {
        let searchVC = SearchVC.loadFromStoryboard()
        searchVC.coordinator = self
        searchVC.viewModel = SearchMovieViewModel(useCase: SearchUseCase(repository: MoviesRepository()))
        
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    func finish() {
        
    }
    
    
    func goToMovieDetailsScreen(_ movie: MovieModel) {
        let movieDetailsCoordinator = MovieDetailCoordinator(navigationController, movie: movie)
        movieDetailsCoordinator.start()
    }
    
    
}
