//
//  BookProgressView.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/6/6.
//

import Foundation
import UIKit

class BookProgressView:UIView {
    var currentPage:Int
    var totalPagesCount:Int
    
    lazy var progressNumberLabel:UILabel = {
        let label = UILabel()
        label.text = String(currentPage) + "/" + String(totalPagesCount)
        label.sizeToFit()
        return label
    }()
    
    lazy var progressPercentLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    init(currentPage: Int, totalPagesCount: Int) {
        self.currentPage = currentPage
        self.totalPagesCount = totalPagesCount
        self.addSubview(progressNumberLabel)
        self.addSubview(progressPercentLabel)
        progressNumberLabel.snp.makeConstraints { make in
            make.centerY.equalTo(progressPercentLabel)
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
