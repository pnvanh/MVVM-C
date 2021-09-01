//
//  String+Extensions.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation

extension String {
    var isNonEmpty: Bool {
        return !isEmpty
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
