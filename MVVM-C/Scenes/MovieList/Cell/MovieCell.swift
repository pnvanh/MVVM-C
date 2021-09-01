//
//  MovieCell.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import UIKit
import RxCocoa
import SDWebImageSVGCoder

class MovieCell: BaseTableViewCell {

    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieReleaseDay: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    let formatter = NumberFormatter()
    var movie: Driver<MovieModel> = Driver.empty()
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func makeLocalizedTexts() {
        
    }
    
    override func bind() {
        movie
            .map { $0.posterPath }
            .drive { [weak self] posterPath in
                if let url = URL(string: ImagePath.Path + posterPath) {
                    self?.movieImage.sd_setImage(with: url, completed: nil)
                }
            }.disposed(by: disposeBag)
        
        movie
            .map { $0.title }
            .drive( movieTitle.rx.text)
            .disposed(by: disposeBag)
        
        movie
            .map { $0.releaseDate }
            .drive( movieReleaseDay.rx.text)
            .disposed(by: disposeBag)
        
        movie
            .map { $0.voteAverage.string }
            .drive( movieRating.rx.text)
            .disposed(by: disposeBag)
    }
}


