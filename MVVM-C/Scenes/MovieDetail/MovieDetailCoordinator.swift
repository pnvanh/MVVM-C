//
//  MovieDetailCoordinator.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import UIKit

class MovieDetailCoordinator: MovieDetailsCoordinatorLogic {
    
    weak var navigationController: UINavigationController?
    private var movie: MovieModel
    
    init(_ navigationController: UINavigationController?, movie: MovieModel) {
        self.navigationController = navigationController
        self.movie = movie
    }
    
    func start() {
        let movieDetailsVC = MovieDetailVC.loadFromStoryboard()
        movieDetailsVC.movie = movie
        movieDetailsVC.coordinator = self
        navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
    
    func finish() {
        
    }
}
