//
//  BookProgressCell.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/6/1.
//

import Foundation
import UIKit
import SnapKit

class BookProgressCell:UICollectionViewCell {
    var bookName = UILabel()

    func update(with model:BookProgressModel) {
        bookName.text = model.bookName
        contentView.addSubview(bookName)
        bookName.snp.makeConstraints { make in
            make.width.height.equalTo(50)
        }
    }
    
}
