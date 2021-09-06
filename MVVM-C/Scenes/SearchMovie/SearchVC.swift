//
//  SearchVC.swift
//  MVVM-C
//
//  Created by Viet Anh on 06/09/2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class SearchVC: BaseViewController{
   
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: SearchMovieViewModel!
    var coordinator: SearchCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func configure() {
        tableView.registerNib(cellName: SearchCell.className)
        tableView.tableFooterView = UIView()
    }

    override func makeLocalizedTexts() {
        setupNavigationBar()
    }
    
    func setupNavigationBar(){
        self.title = "Search"
    }

    override func bind() {
        
        let results = searchBar.rx.text.orEmpty
            .throttle(.microseconds(200), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest { query -> Driver<[MovieModel]> in
                let input = SearchMovieViewModel.Input(search:  Driver.just("\(query)"))
                return self.viewModel.transform(input).movie
            }
            .asDriver(onErrorJustReturn: [] )
        
        results
            .drive(tableView.rx.items(cellIdentifier: SearchCell.className,
                                         cellType: SearchCell.self)) {
              (_ , movie , cell) in
                cell.movie = Driver.just(movie)
                cell.bind()
            }
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(MovieModel.self)
            .subscribe { [weak self] movie in
                self?.coordinator?.goToMovieDetailsScreen(movie)
            }
            .disposed(by: disposeBag)
        
    }

}
