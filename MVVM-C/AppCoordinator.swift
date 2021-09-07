//
//  AppCoordinator.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import UIKit

class AppCoordinator {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {

        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let startCoordinator = TabBarCoordinator(navigationController: navigationController)
        startCoordinator.start()
        
    }
    
    func finish() {
        
    }
}
