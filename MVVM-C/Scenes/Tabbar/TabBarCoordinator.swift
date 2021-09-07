//
//  TabBarCoordinator.swift
//  MVVM-C
//
//  Created by Viet Anh on 07/09/2021.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
        
        let movieNavigationController = UINavigationController()
        movieNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let movieCoordinator = MovieCoordinator(navigationController: movieNavigationController)
        movieCoordinator.start()
        
        let searchNavigationController = UINavigationController()
        searchNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        let searchCoordinator = SearchCoordinator(navigationController: searchNavigationController)
        searchCoordinator.start()
        
        tabBarController.viewControllers = [movieNavigationController,
                                            searchNavigationController]
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController?.present(tabBarController, animated: false, completion: nil)
    }
    
    func finish() {
        
    }
    
    
}
