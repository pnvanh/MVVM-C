//
//  MovieCoordinator.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation
import UIKit

class MovieCoordinator: MoviesCoordinatorLogic {
 

    private let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }
    
    weak var navigationController: UINavigationController?
    
  
    func start() {
        let movieVC = MovieListVC.loadFromStoryboard()
        movieVC.coordinator = self
        movieVC.viewModel = MovieViewModel(useCase: MoviesUseCase(repository: MoviesRepository()))
        let rootNavigation = UINavigationController(rootViewController: movieVC)
        window?.rootViewController = rootNavigation
        navigationController = rootNavigation
    }
    
    func finish() {
        
    }
    
    
    func goToMovieDetailsScreen(_ movie: MovieModel) {
        let movieDetailsCoordinator = MovieDetailCoordinator(navigationController, movie: movie)
        movieDetailsCoordinator.start()
    }
    
    
}
