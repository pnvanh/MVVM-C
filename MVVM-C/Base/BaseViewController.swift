//
//  BaseViewController.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController, Bindable {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLocalizedTexts()
        configure()
        bind()
    }
    
    func makeLocalizedTexts() {
        
    }
    
    func configure() {
        // should be override
    }
    
    func bind() {
        // should be override
    }
}

// MARK: - Load View From Storyboard
extension UIViewController {
    class func loadFromStoryboard() -> Self {
        return instantiateFromStoryboardHelper(self.className)
    }

    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
}

