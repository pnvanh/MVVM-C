//
//  SearchCoordinatior.swift
//  MVVM-C
//
//  Created by Viet Anh on 06/09/2021.
//

import Foundation
import UIKit

class SearchCoordinator: SearchCoordinatorLogic {
 

    private let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }
    
    weak var navigationController: UINavigationController?
    
  
    func start() {
        let searchVC = SearchVC.loadFromStoryboard()
        searchVC.coordinator = self
        searchVC.viewModel = SearchMovieViewModel(useCase: SearchUseCase(repository: MoviesRepository()))
     
        let rootNavigation = UINavigationController(rootViewController: searchVC)
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
