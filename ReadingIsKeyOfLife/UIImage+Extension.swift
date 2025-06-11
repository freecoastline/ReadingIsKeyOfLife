//
//  UIImage+Extension.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/6/11.
//

import Foundation
import UIKit

extension UIImage {
    public convenience init(_ colors: [UIColor], bounds: CGRect) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map({ $0.cgColor })
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        UIGraphicsBeginImageContext(bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        UIGraphicsEndImageContext()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        guard let currentCGImage = image?.cgImage else {
            return
        }
        self.init(cgImage: currentCGImage)
    }
}
