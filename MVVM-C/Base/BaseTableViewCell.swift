//
//  BaseTableViewCell.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import UIKit
import RxSwift

class BaseTableViewCell: UITableViewCell, Bindable {

    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bind()
        makeLocalizedTexts()
    }

    override func prepareForReuse() {
        makeLocalizedTexts()
    }
    
    func bind() {
        // should be override
    }
    
    func makeLocalizedTexts() {
        // should be override
    }
}
