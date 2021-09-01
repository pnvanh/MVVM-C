//
//  APIBaseOutput.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation
import ObjectMapper

class APIBaseOutput: Mappable {

    var code: Int = 0
    var success: Bool = false
    var message: String = ""
    
    init() {

    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        code <- map["code"]
        success <- map["success"]
        message <- map["message"]
    }

    var errorMessageDisplaying: String {
        return message
    }
}
