//
//  BookSecondViewController.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/5/31.
//

import Foundation
import UIKit

class BookSecondViewController:UIViewController {
    lazy var expandLabel:UILabel = {
        let label = UILabel()
        label.text = "kenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenkenenkenkenkenkenkenkenkenkenkenkenkenkenkenenkenkenkenknkenkenkenkenkenkenkenenkenkenkenknkenkenkenkenkenkenkenenkenkenkenknkenkenkenkenkenkenkenenkenkenkenknkenkenkenkenkenkenkenenkenkenkenknkenkenkenkenkenkenkenenkenkenkenknkenkenkenkenkenkenkenenkenkenkenknkenkenkenkenkenkenkenenkenkenkenknkenkenkenkenkenkenkenenkenkenkenknkenkenkenkenkenkenkenkenkenkenke"
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    override func viewDidLoad() {
        view.backgroundColor = .green
        view.addSubview(expandLabel)
        expandLabel.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.center.equalToSuperview()
        }
    }
    
    
}


