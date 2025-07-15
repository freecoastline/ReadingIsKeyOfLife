//
//  BookProgressCell.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/6/1.
//

import Foundation
import UIKit
import SnapKit
import Combine

class BookProgressCell:UICollectionViewCell {
    var currentModel: BookProgressModel?
    var cancellable = Set<AnyCancellable>()
    
    lazy var bookName:UILabel = {
        let label = UILabel()
        label.text = "default bookname"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.sizeToFit()
        return label
    }()
    
    lazy var author:UILabel = {
        let label = UILabel()
        label.text = "default label"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.sizeToFit()
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(progressUpdate)))
        return label
    }()
    
    lazy var coverImageView:UIImageView = {
        let imageView = UIImageView(frame: CGRectZero)
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(progressUpdate)))
        return imageView
    }()
    
    var progressValue:Float = 0.0 {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {[weak self] in
                guard let self else {
                    return
                }
                self.progressView.setProgress(progressValue, animated: true)
            }
        }
    }
    
    @objc
    func progressUpdate() {
        progressValue += 0.3
    }
    
    var bookType = UILabel()
    var spacer = UIView()
    var hspacer = UIView()
    
    var vstackView = UIStackView()
    var hstackView = UIStackView()

    lazy var progressView = GradientProgressView(progressViewStyle: .bar)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        vstackView.addArrangedSubview(bookName)
        vstackView.addArrangedSubview(author)
        vstackView.addArrangedSubview(progressView)
        
        vstackView.alignment = .leading
        vstackView.axis = .vertical
        coverImageView.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
        progressView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.leading.trailing.equalToSuperview()
        }
        progressView.backgroundColor = .blue
        hstackView.addArrangedSubview(coverImageView)
        hstackView.addArrangedSubview(vstackView)
        hstackView.addArrangedSubview(hspacer)
        contentView.addSubview(hstackView)
        hstackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backgroundColor = .gray
        setupBinding()
    }
    
    func setupBinding() {
        
    }
    
    func update(with model:BookProgressModel) {
        currentModel = model
        bookName.text = currentModel?.bookName
        author.text = currentModel?.author
        coverImageView.image = currentModel?.coverImage

//        progressView.currentPage = currentModel?.currentPage ?? 0
//        progressView.totalPagesCount = currentModel?.pageCount ?? 0
    }
}
