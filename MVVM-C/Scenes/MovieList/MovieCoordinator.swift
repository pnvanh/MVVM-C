//
//  MovieCoordinator.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation
import UIKit

class MovieCoordinator: MoviesCoordinatorLogic {
 
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let movieVC = MovieListVC.loadFromStoryboard()
        movieVC.coordinator = self

        movieVC.viewModel = MovieViewModel(useCase: MoviesUseCase(repository: MoviesRepository()))
        
        navigationController?.pushViewController(movieVC, animated: true)
    }
    
    func finish() {
        
    }
    
    
    func goToMovieDetailsScreen(_ movie: MovieModel) {
        let movieDetailsCoordinator = MovieDetailCoordinator(navigationController, movie: movie)
        movieDetailsCoordinator.start()
    }
    
    
}
