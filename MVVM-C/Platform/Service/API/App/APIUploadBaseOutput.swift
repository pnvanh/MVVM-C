//
//  APIUploadBaseOutput.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation
import ObjectMapper

class APIUploadBaseOutput: Mappable {

    var code: Int = 0
    var success: Bool = false
    var message: String = ""
    
    init() {

    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        code <- map["status_code"]
        success <- map["success"]
        message <- map["status_message"]
    }

    var errorMessageDisplaying: String {
        return message
    }
}
