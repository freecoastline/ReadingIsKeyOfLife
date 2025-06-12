//
//  GradientProgressView.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/6/11.
//

import Foundation
import UIKit

class GradientProgressView: UIProgressView {
    var firstColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    var secondColor: UIColor = UIColor.black {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        let colors = [firstColor, secondColor]
        if let currentGradientImage = UIImage(colors, bounds: self.bounds) {
            self.progressImage = currentGradientImage
        }
        let image = UIImage(colors, bounds: self.bounds)
        self.progressImage = image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
