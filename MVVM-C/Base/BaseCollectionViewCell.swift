//
//  BaseCollectionViewCell.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import UIKit
import RxSwift

class BaseCollectionViewCell: UICollectionViewCell {
    
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeLocalizedTexts()
    }

    override func prepareForReuse() {
        makeLocalizedTexts()
    }
    
    func makeLocalizedTexts() {
        // should be override
    }
}
