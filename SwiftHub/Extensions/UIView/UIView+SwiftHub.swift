//
//  UIView+SwiftHub.swift
//  SwiftHub
//
//  Created by Khoren Markosyan on 1/4/17.
//  Copyright © 2017 Khoren Markosyan. All rights reserved.
//

import UIKit
import Foundation

extension UIView {

    func makeRoundedCorners(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }

    func makeRoundedCorners() {
        makeRoundedCorners(bounds.size.width / 2)
    }

    func renderAsImage() -> UIImage? {
        var image: UIImage?
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
            image = renderer.image { ctx in
                self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
            }
        } else {
            // Fallback on earlier versions
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0)
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        return image
    }
}
