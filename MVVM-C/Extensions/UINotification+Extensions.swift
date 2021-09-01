//
//  UINotification+Extensions.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation

extension Notification.Name {
    static let keyboardChangeFrame = Notification.Name("Keyboard Change Frame")
    static let didChangeStateOfServices = Notification.Name("Did Change State Of Services")
    static let unauthorized = Notification.Name("Authentication unauthorized")
}
