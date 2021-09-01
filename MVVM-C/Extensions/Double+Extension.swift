//
//  Double+Extension.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import UIKit

extension Double {
    var string: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        formatter.roundingMode = .floor
        return formatter.string(for: self) ?? description
    }
}
