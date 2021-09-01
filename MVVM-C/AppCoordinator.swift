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
        guard let window = window else {
            return
        }
        
        let movieCoordinator = MovieCoordinator(window: self.window)
        movieCoordinator.start()
        window.makeKeyAndVisible()
    }
    
    func finish() {
        
    }
}
