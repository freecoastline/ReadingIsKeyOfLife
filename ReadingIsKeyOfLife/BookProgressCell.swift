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
    var author = UILabel()
    var currentProgress = 0.0
    var coverImageView:UIImageView = {
        let imageView = UIImageView(frame: CGRectZero)
        return imageView
    }()
    
    var progressNumberLabel = UILabel()
    var progressPercentLabel = UILabel()
    var bookType = UILabel()
    
    var stackView = UIStackView()
    
    func update(with model:BookProgressModel) {
        bookName.text = model.bookName
        bookName.font = .systemFont(ofSize: 12, weight: .bold)
        author.text = model.author
        author.font = .systemFont(ofSize: 8, weight: .medium)
        stackView.addArrangedSubview(bookName)
        stackView.setCustomSpacing(12, after: bookName)
        stackView.addArrangedSubview(author)
        stackView.setCustomSpacing(12, after: author)
        stackView.alignment = .leading
        stackView.axis = .vertical
        bookName.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        author.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        
        currentProgress = model.currentPage / model.pageCount
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
        coverImageView.image = model.coverImage
        backgroundColor = .gray
    }
    
}
