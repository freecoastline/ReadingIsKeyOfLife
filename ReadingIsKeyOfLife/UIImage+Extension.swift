//
//  UIImage+Extension.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/6/11.
//

import Foundation
import UIKit

extension UIImage {
    public convenience init?(_ colors: [UIColor], bounds: CGRect) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map({ $0.cgColor })
        gradientLayer.frame = bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        UIGraphicsBeginImageContext(bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let currentCGImage = image?.cgImage else {
            return nil
        }
        self.init(cgImage: currentCGImage)
    }
}
