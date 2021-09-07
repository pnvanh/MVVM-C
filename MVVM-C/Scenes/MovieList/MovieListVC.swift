//
//  MovieListVC.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class MovieListVC: BaseViewController, UIScrollViewDelegate {
    
    @IBOutlet fileprivate weak var movieTableView: UITableView!
    
    var viewModel: MovieViewModel!
    var coordinator: MovieCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigationBar()
    }
    override func configure() {
        movieTableView.registerNib(cellName: MovieCell.className)
        movieTableView.tableFooterView = UIView()
    }

    override func makeLocalizedTexts() {
        
    }
    
    func setupNavigationBar(){
        self.title = "Movie"
    }
    
    override func bind() {
        
        let input = MovieViewModel.Input(loadStrigger: Driver.just(viewModel.pageNumber))
        
        let output = viewModel?.transform(input)
            .movie
            .asObservable()
            .throttle(.microseconds(200), scheduler: MainScheduler.instance)
            .flatMapLatest { drive -> Driver<[MovieModel]> in
                return self.viewModel.transform(input).movie
            }.asDriver(onErrorJustReturn: [] )
        
        output?
            .drive(movieTableView.rx.items(cellIdentifier: MovieCell.className, cellType: MovieCell.self))
            { (_ , movie , cell) in
                cell.movie = Driver.just(movie)
                cell.bind()
            }
            .disposed(by: disposeBag)
        
        movieTableView.rx
            .modelSelected(MovieModel.self)
            .subscribe { [weak self] movie in
                self?.coordinator?.goToMovieDetailsScreen(movie)
            }
            .disposed(by: disposeBag)
        
        movieTableView.rx.didScroll.subscribe{ [weak self] _ in
            guard let self = self else { return }
            let offSetY = self.movieTableView.contentOffset.y
            let contentHeight = self.movieTableView.contentSize.height

            if offSetY == (contentHeight - self.movieTableView.frame.size.height) {
               print("Load More")
                //not yet
            }
        }.disposed(by: disposeBag)
    }

}
