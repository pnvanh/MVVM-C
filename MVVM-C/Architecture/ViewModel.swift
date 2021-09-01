//
//  ViewModel.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

protocol ViewModel {
    associatedtype Input
    associatedtype Output
        
    func transform(_ input: Input) -> Output
}
