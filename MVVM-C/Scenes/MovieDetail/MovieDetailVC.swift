//
//  MovieDetailVC.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import UIKit
import RxCocoa


class MovieDetailVC: BaseViewController {

    @IBOutlet fileprivate weak var movieOverview: UILabel!
    @IBOutlet fileprivate weak var movieRating: UILabel!
    @IBOutlet fileprivate weak var movieLanguages: UILabel!
    @IBOutlet fileprivate weak var movieReleaseDay: UILabel!
    @IBOutlet fileprivate weak var movieTitle: UILabel!
    @IBOutlet fileprivate weak var movieImage: UIImageView!
    
    var movie: MovieModel?
    var coordinator: MovieDetailCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    override func configure() {
        movieImage.sd_setImage(with: URL(string: ImagePath.Path + "\(movie?.posterPath ?? "")"), completed: nil)
        movieTitle.text = movie?.title
        movieReleaseDay.text = movie?.releaseDate
        movieLanguages.text = movie?.originalLanguage
        movieOverview.text = movie?.overview
        movieRating.text = movie?.voteAverage.string
    }
    
}
