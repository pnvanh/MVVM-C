//
//  NSObject+Extentions.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation

import Foundation

extension NSObject {
    @objc var className: String {
        return String(describing: type(of: self))
    }

    @objc class var className: String {
        return String(describing: self)
    }
}
