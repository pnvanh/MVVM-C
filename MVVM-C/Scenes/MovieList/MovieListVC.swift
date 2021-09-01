//
//  MovieListVC.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import UIKit
import RxCocoa
import RxSwift

class MovieListVC: BaseViewController {
    
    @IBOutlet fileprivate weak var movieTableView: UITableView!
    
    var viewModel: MovieViewModel?
    var coordinator: MovieCoordinator?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func configure() {
        movieTableView.registerNib(cellName: MovieCell.className)
        movieTableView.tableFooterView = UIView()
    }

    override func makeLocalizedTexts() {
        
    }
    
    override func bind() {
        
        let input = MovieViewModel.Input(loadStrigger: Driver.just(viewModel?.pageNumber ?? 1))
        let output = viewModel?.transform(input)
        
        output?.movie.drive(movieTableView.rx.items(cellIdentifier: MovieCell.className, cellType: MovieCell.self)) { _, movie, cell in
            cell.movie = Driver.just(movie)
            cell.bind()
        }.disposed(by: disposeBag)
        
        movieTableView
            .rx
            .modelSelected(MovieModel.self)
            .subscribe { [weak self] movie in
                self?.coordinator?.goToMovieDetailsScreen(movie)
            }.disposed(by: disposeBag)
    }
}
