//
//  API_URL.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation

class APIURL {
    
    #if DEBUG
    private static let host = "http://api.themoviedb.org"
    #else
    private static let host = "http://api.themoviedb.org"
    #endif
    
    static let apiVersion = "/3"
    
    static let urlRoot = host + apiVersion
    
    // App
    static let discover = urlRoot + "/discover/movie"
    static let teamDetails = urlRoot + "/teams/%d"
}

