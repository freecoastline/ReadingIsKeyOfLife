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
    var currentModel: BookProgressModel?
    var bookName = UILabel()
    var author = UILabel()
    var currentProgress = 0.0
    var coverImageView:UIImageView = {
        let imageView = UIImageView(frame: CGRectZero)
        return imageView
    }()
    
    var bookType = UILabel()
    
    var spacer = UIView()
    var hspacer = UIView()
    
    var vstackView = UIStackView()
    var hstackView = UIStackView()

    var progressView:UIView {
        guard let currentModel else {
            return UIView()
        }
        return BookProgressView(currentPage: currentModel.currentPage, totalPagesCount: currentModel.pageCount)
    }
    
    func update(with model:BookProgressModel) {
        currentModel = model
        bookName.text = model.bookName
        bookName.font = .systemFont(ofSize: 12, weight: .bold)
        bookName.sizeToFit()
        
        author.text = model.author
        author.font = .systemFont(ofSize: 8, weight: .medium)
        author.sizeToFit()
        vstackView.addArrangedSubview(bookName)
        vstackView.setCustomSpacing(12, after: bookName)
        vstackView.addArrangedSubview(author)
        vstackView.setCustomSpacing(12, after: author)
        vstackView.alignment = .leading
        vstackView.axis = .vertical
        vstackView.addArrangedSubview(progressView)
        vstackView.setCustomSpacing(12, after: progressView)
        vstackView.addArrangedSubview(spacer)
        
        coverImageView.image = model.coverImage
        coverImageView.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
        hstackView.addArrangedSubview(coverImageView)
        hstackView.addArrangedSubview(vstackView)
        hstackView.addArrangedSubview(hspacer)
        contentView.addSubview(hstackView)
        hstackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundColor = .gray
    }
    
}
