//
//  Coordinator.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import UIKit

protocol Coordinator {

    var navigationController: UINavigationController? { get set }
    
    func start()
    func finish()
    
}

