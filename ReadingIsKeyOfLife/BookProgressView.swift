//
//  BookProgressView.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/6/6.
//

import Foundation
import UIKit

class BookProgressView:UIView {
    var currentPage:Int = 0
    var totalPagesCount:Int = 0
    let kProgressTotalLength = 200
    let kProgressTotalHeight = 30
    var percent:Int {
        currentPage / totalPagesCount
    }
    
    lazy var progressNumberLabel:UILabel = {
        let label = UILabel()
        label.text = String(currentPage) + "/" + String(totalPagesCount)
        label.font = .systemFont(ofSize: 12)
        label.sizeToFit()
        return label
    }()
    
    lazy var progressPercentLabel:UILabel = {
        let label = UILabel()
        label.text = String(percent) + "%"
        label.font = .systemFont(ofSize: 12)
        label.sizeToFit()
        return label
    }()
    
    lazy var progressBackground:UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        return backgroundView
    }()
    
    lazy var actualProgressView:UIView = {
        let actualProgress = UIView()
        actualProgress.backgroundColor = .blue
        return actualProgress
    }()
    
    init(currentPage: Int, totalPagesCount: Int) {
        super.init(frame: CGRectZero)
        self.currentPage = currentPage
        self.totalPagesCount = totalPagesCount
        addSubview(progressNumberLabel)
        addSubview(progressPercentLabel)
        addSubview(progressBackground)
        progressBackground.addSubview(actualProgressView)
        progressBackground.snp.makeConstraints { make in
            make.height.equalTo(kProgressTotalHeight)
            make.width.equalTo(kProgressTotalLength)
        }
        progressNumberLabel.snp.makeConstraints { make in
            make.centerY.equalTo(progressPercentLabel)
            make.bottom.equalTo(progressBackground.snp_topMargin).offset(-10)
            make.leading.equalToSuperview()
        }
        progressPercentLabel.snp.makeConstraints { make in
            make.leading.equalTo(progressNumberLabel).offset(180)
        }

        actualProgressView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalTo(Double(kProgressTotalLength) * 0.5)
        }
        layoutIfNeeded()
        progressBackground.layer.cornerRadius = progressBackground.bounds.height / 2
        progressBackground.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
