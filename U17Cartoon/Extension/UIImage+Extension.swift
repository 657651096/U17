//
//  UIImage+Extension.swift
//  U17Cartoon
//
//  Created by xiaoyao on 2022/8/18.
//

import Foundation
import UIKit

extension UIImage {
    class func imageWithColor(color: UIColor?, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        if color == nil || size.width <= 0 || size.height <= 0 {
            return nil
        }
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color!.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
