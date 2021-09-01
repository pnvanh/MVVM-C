//
//  API_Movie.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation
import RxSwift
import ObjectMapper

extension APIService {
    
    func fetchingListMovie(_ input: FetchingMoviesInput) -> Observable<FetchingMoviesOutput> {
        return request(input)
    }
    
    
    
}

//MARK: - Fetch Movies Input
class FetchingMoviesInput: APIBaseInput {
    init(_ pageNumber: Int){
        let params: [String : Any] = [
            "api_key" : APIKey.api_key,
            "page": pageNumber
        ]
        super.init(urlString: APIURL.discover, method: .get, parameters: nil, urlParams: params, encoding: nil)
    }
}

//MARK: - Fetch Movies Output
class FetchingMoviesOutput: APIBaseOutput {
    var movies: [MovieModel]?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        movies <- map["results"]
    }
    
}
