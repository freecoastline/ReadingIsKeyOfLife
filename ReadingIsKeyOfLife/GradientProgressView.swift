//
//  GradientProgressView.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/6/11.
//

import Foundation
import UIKit

class GradientProgressView: UIProgressView {
    var firstColor: UIColor {
        .black
    }
    
    var secondColor: UIColor {
        .white
    }
    
    func updateView(by colors:[UIColor], bound: CGRect) {
        let image = UIImage(colors, bounds: bound)
        self.progressImage = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
