//
//  UICollectionView+Extensions.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation
import UIKit

extension UICollectionView {
    public func registerNib(cellName name: String) {
        register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: name)
    }

    public func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as! T
    }
}
